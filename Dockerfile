FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    tar \
    && rm -rf /var/lib/apt/lists/*

ENV HERMES_VERSION=1.10.0

RUN curl -L -o /tmp/hermes.tar.gz \
    "https://github.com/informalsystems/hermes/releases/download/v${HERMES_VERSION}/hermes-v${HERMES_VERSION}-x86_64-unknown-linux-gnu.tar.gz" \
    && tar -xzf /tmp/hermes.tar.gz -C /tmp \
    && mv /tmp/hermes /usr/local/bin/hermes \
    && chmod +x /usr/local/bin/hermes \
    && rm -rf /tmp/hermes.tar.gz /tmp/hermes

WORKDIR /app

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
