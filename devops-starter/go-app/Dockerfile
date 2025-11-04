FROM golang:1.20-alpine AS build
WORKDIR /src
COPY . .
RUN go mod init example.com/go-app || true && go build -o /go-app

FROM alpine:3.18
RUN apk add --no-cache ca-certificates
COPY --from=build /go-app /go-app
EXPOSE 8080
ENTRYPOINT ["/go-app"]    
