#!/bin/bash

# -------------------------------------------------
# Author: 元芳
# Description: 一键自动部署 + 自动推送 + 自动化内容生成 + 宝塔面板对接
# -------------------------------------------------

# ----------------------------------------
# 更新系统和安装必备软件
# ----------------------------------------

echo "🚀 [INFO] 更新系统..."
sudo apt update && sudo apt upgrade -y

echo "👉 [STEP] 安装必要工具..."
sudo apt install -y python3 python3-pip docker.io docker-compose git curl

# ----------------------------------------
# 安装依赖 Python 环境
# ----------------------------------------

echo "👉 [STEP] 安装 Python 库..."
pip3 install -r requirements.txt

# ----------------------------------------
# 获取 GitHub 仓库并推送
# ----------------------------------------

echo "👉 [STEP] 克隆最新的 GitHub 仓库..."
git clone https://github.com/YOUR_REPO/your_project.git

cd your_project

echo "👉 [STEP] 提交到 GitHub..."
git add .
git commit -m "自动推送：$(date '+%Y-%m-%d %H:%M:%S')"
git push origin main

# ----------------------------------------
# 启动 Docker 容器
# ----------------------------------------

echo "👉 [STEP] 启动 Docker 容器..."
sudo docker-compose up -d

# ----------------------------------------
# 自动生成内容
# ----------------------------------------

echo "👉 [STEP] 生成内容..."
python3 ai_content_gen.py

# ----------------------------------------
# 宝塔面板创建网站和 SSL 配置
# ----------------------------------------

echo "👉 [STEP] 调用宝塔 API 创建网站..."
bash bt_panel_api.sh

echo "✅ [DONE] 部署成功！🎉"
