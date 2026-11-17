FROM rust:1-bookworm

ARG UID=1000
ARG GID=1000

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential pkg-config curl wget file git ca-certificates xdg-utils \
    libwebkit2gtk-4.1-dev libgtk-3-dev libssl-dev libxdo-dev \
    libayatana-appindicator3-dev librsvg2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs && rm -rf /var/lib/apt/lists/*

RUN groupadd -g ${GID} dev && useradd -m -u ${UID} -g ${GID} dev \
    && mkdir -p /app && chown dev:dev /app

ENV CARGO_HOME=/app/.cargo

USER dev
WORKDIR /app