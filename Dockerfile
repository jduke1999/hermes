FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 1. 降级到上一个绝对稳定的 0.1.18 版本，避开官方今天的打包 Bug
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir hermes-agent==0.1.18

EXPOSE 7860

# 2. 启动时通过参数直接强行开启全局无限制访问
CMD ["hermes", "dashboard", "--host", "0.0.0.0", "--port", "7860", "--insecure", "--allow-all-users"]
