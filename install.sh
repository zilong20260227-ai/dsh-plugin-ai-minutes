#!/bin/bash
# AI听记 插件 · 一条命令安装（需要邀请码，向管理员要）
# 用法：bash <(curl -fsSL http://<地址>/dl/install.sh) TJ-XXXX-XXXX
set -e

BASE="https://raw.githubusercontent.com/zilong20260227-ai/dsh-plugin-ai-minutes/refs/heads/main"
VER="0.9.4"
INVITE="${1:-}"
DEST="$HOME/.dsh-plugins/ai-minutes"

say() { printf '%s\n' "$*"; }

if [ -z "$INVITE" ]; then
  say "缺少邀请码。用法："
  say "  bash <(curl -fsSL $BASE/dl/install.sh) TJ-XXXX-XXXX"
  exit 1
fi

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

say "① 下载插件包 $VER …"
curl -fsSL "$BASE/ai-minutes-$VER.zip" -o "$TMP/p.zip"
say "   $(wc -c < "$TMP/p.zip" | tr -d ' ') 字节"

say "② 安装到 $DEST …"
mkdir -p "$HOME/.dsh-plugins"
rm -rf "$DEST"
unzip -q "$TMP/p.zip" -d "$TMP/x"
cp -R "$TMP/x/ai-minutes" "$DEST"
rm -f "$DEST/安装.command" "$DEST/安装说明.txt"
printf '%s' "$INVITE" > "$DEST/.invite"
chmod 600 "$DEST/key/id_ed25519" "$DEST/.invite" 2>/dev/null || true

say ""
say "=============================================="
say " 装好了。把下面这一行复制，粘贴到"
say " DSH → 插件 → + 添加插件 的输入框里："
say ""
say "   $DEST"
say ""
say "=============================================="
say ""
say "粘贴 → 安装 → 提示重启就重启 DSH。"
say "首次启动会用邀请码自动登记这台设备（邀请码只能用一次）。"
