#!/bin/bash
set -e

if [ ! -f "/root/.hermes/config.toml" ]; then
    echo "❌ 未找到 config.toml 文件！"
    echo "请通过 Railway Volume 或 Railway Shell 上传你的配置文件和密钥。"
    tail -f /dev/null
else
    echo "🚀 启动 Hermes v$(hermes version)..."
    exec hermes --config /root/.hermes/config.toml start
fi
