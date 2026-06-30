#!/usr/bin/env bash
set -e

# Railway 会提供 PORT 环境变量
export PORT=${PORT:-3000}

# 这里替换成 Hermes 官方启动命令
# 示例：
# hermes --host 0.0.0.0 --port $PORT

echo "Starting Hermes on port $PORT..."
hermes --host 0.0.0.0 --port $PORT
