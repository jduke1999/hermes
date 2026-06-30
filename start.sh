#!/usr/bin/env bash
set -e

echo "Hermes version:"
hermes --version || true

echo "Starting Hermes..."
# 这里替换成你真正的配置启动命令
# 例如：hermes start
# 如果还没有配置，就先保持容器不退出
tail -f /dev/null
