# 1. 使用官方推荐的 Python 3.11 基础镜像
FROM python:3.11-slim

# 2. 安装基本系统依赖
RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# 3. 设置工作目录
WORKDIR /app

# 4. 升级 pip 并直接通过官方源安装 hermes-agent
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir hermes-agent

# 5. 暴露 Hermes 默认的 Dashboard 端口
EXPOSE 7860

# 6. 启动官方网关
CMD ["hermes", "dashboard", "--host", "0.0.0.0", "--port", "7860", "--insecure"]
