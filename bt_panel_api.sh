#!/bin/bash

# ----------------------------------------
# Function: 调用宝塔面板 API 创建网站 + SSL 配置
# ----------------------------------------

BT_PANEL="http://127.0.0.1:8888"
API_KEY="YOUR_BT_API_KEY"

echo "🚀 [INFO] 调用宝塔 API 创建网站..."

curl -ks -X POST $BT_PANEL/data?action=AddSite \
    -d "webname=auto.yourdomain.com" \
    -d "path=/www/wwwroot/auto.yourdomain.com" \
    -d "type=PHP" \
    -d "port=80" \
    -d "ps=自动生成站点" \
    -H "Authorization: Bearer $API_KEY"

echo "👉 [STEP] 配置 SSL..."
curl -ks -X POST $BT_PANEL/data?action=SiteSSL \
    -d "id=YOUR_SITE_ID" \
    -d "ps=自动SSL配置" \
    -H "Authorization: Bearer $API_KEY"

echo "✅ [DONE] 宝塔面板已创建站点并配置 SSL！"
