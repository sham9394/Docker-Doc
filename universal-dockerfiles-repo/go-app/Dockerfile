# Universal Dockerfile - Go (multi-stage)
ARG BASE=golang:1.21-alpine
FROM ${BASE} AS builder
ARG APP_HOME=/app
WORKDIR $APP_HOME

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o app ./...

FROM alpine:3.18 AS runtime
ARG APP_HOME=/app
WORKDIR $APP_HOME

RUN adduser -D appuser
USER appuser

COPY --from=builder $APP_HOME/app $APP_HOME/app

ENV PORT=8080
EXPOSE $PORT

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s CMD wget -qO- http://localhost:$PORT/health || exit 1

CMD ["./app"]
