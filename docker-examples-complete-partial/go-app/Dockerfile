FROM golang:1.22 AS build
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download || true
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o app .
FROM alpine
WORKDIR /app
COPY --from=build /app/app .
EXPOSE 8080
CMD ["./app"]