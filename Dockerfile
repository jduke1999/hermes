FROM ubuntu:22.04

ENV HERMES_VERSION=1.10.0
ENV DEBIAN_FRONTEND=noninteractive

# 安装最小依赖 (加入了 curl)
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 下载 Hermes 官方预编译二进制
RUN curl -L -o hermes.tar.gz \
    "https://github.com/informalsystems/hermes/releases/download/v${HERMES_VERSION}/hermes-v${HERMES_VERSION}-x86_64-unknown-linux-gnu.tar.gz" \
    && tar -xzvf hermes.tar.gz \
    && mv hermes /usr/local/bin/hermes \
    && chmod +x /usr/local/bin/hermes \
    && rm hermes.tar.gz

# 创建配置目录
RUN mkdir -p /root/.hermes

COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /root/.hermes
CMD ["/start.sh"]
