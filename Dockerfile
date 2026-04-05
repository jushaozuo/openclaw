FROM node:22-slim
RUN npm install -g pnpm
RUN apt-get update && apt-get install -y psmisc lsof procps && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . .
RUN pnpm install
RUN pnpm build
ENV DEFAULT_MODEL=openai/deepseek-chat
ENV OPENAI_API_MODEL=deepseek-chat
ENV GATEWAY_AUTH_TOKEN=8323607608
ENV TELEGRAM_ENABLED=true
ENV TELEGRAM_TOKEN=8755126603:AAEvhaDa9PjET1GahOzjdlL2054p1Jyta-M
CMD ["node", "dist/index.js", "gateway", "--agent-model", "openai/deepseek-chat", "--allow-unconfigured"]
