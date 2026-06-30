FROM debian:bookworm-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    bash \
    && rm -rf /var/lib/apt/lists/*

# 这里替换成 Hermes 官方安装命令
# 示例：
# RUN curl -fsSL https://xxx/hermes/install.sh | bash

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

EXPOSE 3000

CMD ["/app/start.sh"]
