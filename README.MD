# 椛鸟风月 · 开源项目

> 这是椛鸟风月我的世界认证服务器的安装程序  
> 当前仅支持 Linux 环境，您亦可选择手动构建

## 介绍

这是一个基于 authlib-injector 的我的世界认证服务器，  
玩家登录方式可以参见：https://paradise.mahoutsukai.cn/help  
服务器配置方式参见：https://paradise.mahoutsukai.cn/helpserver

## Linux 安装

1. 执行

```
$ ./install.sh
```

2. 编辑 .env 文件

```
# General Config
HOST="0.0.0.0"
SERVE_PORT="8001"
DEV_PORT="8002"

# Site Config
SITE_NAME="椛鸟风月 · 开源项目"
LOGO="https://cdn.mahoutsukai.cn/assets/tilty/images/tilty_logo.png"
DOMAIN="paradise.opensource.mahoutsukai.cn"
ENABLE_SSL=false

# Mail Config
SMTP_HOST="smtp.mxhichina.com"
SMTP_USER="tiltysola@example.com"
SMTP_PASS="example"
```

3. 启动服务器

```
npm run serve
```

## 手动构建

1. 克隆前端项目

```
git clone https://github.com/tiltysola/paradise-frontend-opensource.git
```

2. 克隆后端项目

```
git clone https://github.com/tiltysola/paradise-backend-opensource.git
```

3. 构建项目

```
cd paradise-frontend-opensource
npm i --registry=https://registry.npmmirror.com
npm run build
cd ../paradise-backend-opensource
npm i --registry=https://registry.npmmirror.com
npm run build
```

4. 执行复制命令

```
cd ../
cp -r ./paradise-backend-opensource/public ./public
cp ./paradise-frontend-opensource/dist/index.css ./public/index.css
cp ./paradise-frontend-opensource/dist/index.js ./public/index.js
ln -s ./paradise-backend-opensource/node_modules ./node_modules
cp ./paradise-backend-opensource/.env.example ./.env
```

5. 启动服务器

```
npm run serve
```

## 许可协议

本软件采用 MIT LISENCE 许可协议。
