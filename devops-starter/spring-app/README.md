# Spring Boot App (minimal)

## Build (locally)
```bash
cd spring-app
mvn package
docker build -t spring-app:local .
```

## Run
```bash
docker run -p 8080:8080 spring-app:local
```
