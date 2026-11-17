FROM node:22-bookworm

# Dependências de runtime do Electron (GTK, NSS, etc.)
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgtk-3-0 libnss3 libasound2 libgbm1 libxss1 libxtst6 \
    libatk-bridge2.0-0 libdrm2 libxkbcommon0 xvfb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

CMD ["npm", "start"]