FROM node:22-slim
RUN npm install -g pnpm
RUN apt-get update && apt-get install -y psmisc lsof procps && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . .
RUN pnpm install
RUN pnpm build
RUN mkdir -p /app/.openclaw && \
    echo '{"gateway":{"agent":{"model":"openai/deepseek-chat"},"auth":{"token":"8323607608"},"telegram":{"enabled":true,"token":"8755126603:AAEvhaDa9PjET1GahOzjdlL2054p1Jyta-M"}}}' > /app/.openclaw/openclaw.json
ENV NODE_ENV=production
CMD ["node", "dist/index.js", "gateway"]
