#!/bin/bash

echo "======================================"
echo "Hermes Container Started"
echo "======================================"

hermes version || echo "hermes not found"

echo "Container will stay alive for debugging..."
echo "PORT=$PORT"

# 关键：保持容器运行，否则 Console 无法连接
tail -f /dev/null
