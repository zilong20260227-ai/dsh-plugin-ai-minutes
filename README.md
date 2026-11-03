# AI听记 · DSH 插件（安装包）

录音转写 + 图文纪要的 DSH 插件安装包。**需要邀请码**（向管理员索取）。

## 安装

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/zilong20260227-ai/dsh-plugin-ai-minutes/main/install.sh) TJ-XXXX-XXXX
```

把 `TJ-XXXX-XXXX` 换成管理员给的邀请码。装完会打印一个本地路径，
粘到 DSH → 插件 → + 添加插件 → 重启 DSH。

## 为什么需要邀请码

插件通过 SSH 隧道连到听记服务，服务端按「设备令牌」识别数据归属。
邀请码一次性使用，用于把一台新设备登记到你的账号下；没有邀请码读不到任何数据。

## 卸载

删除 `~/.dsh-plugins/ai-minutes`，在 DSH 插件页停用即可。

## 说明

- 本仓库只存放安装包，不含服务端代码与任何数据。
- 安装包内的 SSH 私钥只能做端口转发，且所有接口都要求设备令牌。
