# 阶段一：构建环境
FROM debian:bookworm-slim AS builder

WORKDIR /tmp

RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# 这里替换为 Hermes 官方安装命令
# 示例：如果是 Rust 项目
# RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# ENV PATH="/root/.cargo/bin:${PATH}"
# RUN git clone https://github.com/xxx/hermes.git && cd hermes && cargo build --release

# 阶段二：运行环境（更小的镜像）
FROM debian:bookworm-slim

WORKDIR /app

# 只安装运行时必需的库
RUN apt-get update && apt-get install -y \
    ca-certificates \
    libssl3 \
    && rm -rf /var/lib/apt/lists/*

# 从构建阶段复制二进制文件（根据实际项目调整路径）
# COPY --from=builder /tmp/hermes/target/release/hermes /usr/local/bin/hermes

# 或者直接在这里执行官方安装（如果官方支持非交互式安装）
RUN curl -fsSL [Hermes官方安装脚本URL] | bash

# Railway 必需：创建启动脚本处理 PORT 环境变量
RUN echo '#!/bin/bash\n\
export PORT=${PORT:-3000}\n\
echo "Starting Hermes on 0.0.0.0:$PORT"\n\
exec hermes --host 0.0.0.0 --port "$PORT" [其他必要参数]' > /app/start.sh && \
chmod +x /app/start.sh

EXPOSE 3000

CMD ["/app/start.sh"]
