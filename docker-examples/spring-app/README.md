# Spring Boot App (Java)
### Prerequisite
Build your JAR first:
```bash
mvn clean package
```
### Build & Run
```bash
docker build -t spring-app .
docker run -d -p 8080:8080 spring-app
```
App runs on: http://localhost:8080
