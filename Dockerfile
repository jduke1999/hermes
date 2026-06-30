FROM debian:bookworm-slim AS builder

RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    ca-certificates \
    tar \
    gzip \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y curl ca-certificates \
  && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL -o /tmp/hermes.tar.gz \
    "https://github.com/informalsystems/hermes/releases/download/v1.10.0/hermes-v1.10.0-x86_64-unknown-linux-gnu.tar.gz" \
    && tar -xzf /tmp/hermes.tar.gz -C /tmp \
    && mv /tmp/hermes /usr/local/bin/hermes \
    && chmod +x /usr/local/bin/hermes

FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/bin/hermes /usr/local/bin/hermes

RUN hermes version
