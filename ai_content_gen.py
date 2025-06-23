#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Author: 元芳专属 AI 脚本
Function: 自动生成 SEO 内容 + 推送
"""

import openai
import os
from datetime import datetime
from dotenv import load_dotenv

# 加载环境变量
load_dotenv()

# 获取 OpenAI API 密钥
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
openai.api_key = OPENAI_API_KEY

def generate_content(prompt):
    """
    调用 GPT-4o 生成内容
    """
    response = openai.ChatCompletion.create(
        model="gpt-4o",
        messages=[
            {"role": "system", "content": "你是一个专业的 SEO 内容生成机器人"},
            {"role": "user", "content": prompt}
        ]
    )
    return response['choices'][0]['message']['content']

def main():
    """
    主入口：生成文章，保存到文件
    """
    topic = "如何自动化部署内容农场"
    content = generate_content(f"请写一篇关于 {topic} 的 1000 字文章")
    now = datetime.now().strftime("%Y%m%d%H%M%S")
    filename = f"./www/{now}_{topic}.md"

    with open(filename, "w", encoding="utf-8") as f:
        f.write(content)

    print(f"✅ 已生成内容文件: {filename}")

if __name__ == "__main__":
    main()
