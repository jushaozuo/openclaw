FROM node:22-slim
RUN npm install -g pnpm
RUN apt-get update && apt-get install -y psmisc lsof procps && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . .
RUN pnpm install
RUN pnpm build
ENV DEFAULT_MODEL=openai/deepseek-chat
ENV OPENAI_API_MODEL=deepseek-chat
CMD ["node", "dist/index.js", "gateway", "--allow-unconfigured"]
