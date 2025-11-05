# Universal Dockerfile - Java (Maven multi-stage)
ARG MAVEN_IMAGE=maven:3.9-eclipse-temurin-17
FROM ${MAVEN_IMAGE} AS builder
ARG APP_HOME=/app
WORKDIR $APP_HOME

COPY pom.xml mvnw* ./
COPY .mvn .mvn
RUN mvn -B -DskipTests package

FROM eclipse-temurin:17-jre-jammy
ARG APP_HOME=/app
WORKDIR $APP_HOME

RUN useradd -m appuser
USER appuser

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080
ENV JAVA_OPTS=""

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s CMD wget -qO- http://localhost:8080/actuator/health || exit 1

CMD ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
