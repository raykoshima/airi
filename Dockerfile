FROM node:20-bookworm-slim

# install build dependencies for canvas
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN corepack enable
RUN pnpm install
RUN pnpm build

EXPOSE 3000
CMD ["pnpm", "start"]