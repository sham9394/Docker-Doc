# Universal Dockerfile - Node.js (multi-stage)
ARG BASE=node:20-alpine
FROM ${BASE} AS builder
ARG APP_HOME=/app
WORKDIR $APP_HOME

# Install build deps (if needed)
RUN apk add --no-cache python3 make g++

COPY package*.json ./
RUN if [ -f package-lock.json ]; then npm ci; else npm install; fi

COPY . .
RUN npm run build --if-present

FROM node:20-alpine AS runtime
ARG APP_HOME=/app
WORKDIR $APP_HOME

RUN addgroup -S nodegrp && adduser -S nodeuser -G nodegrp
USER nodeuser

ENV PORT=3000
EXPOSE $PORT

COPY --from=builder $APP_HOME $APP_HOME

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s CMD wget -qO- http://localhost:$PORT/health || exit 1

CMD ["node", "dist/index.js"]
