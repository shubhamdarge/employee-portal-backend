# --- Build stage: builds the jar inside a container (no Maven on your laptop needed)
FROM maven:3.8.8-openjdk-8 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -q -e -DskipTests dependency:go-offline
COPY src ./src
RUN mvn -q -e -DskipTests package

# --- Runtime stage: small JRE-only image for running the app
FROM openjdk:8-jre-slim
WORKDIR /app
# The jar built in the previous stage (adjust name if your final jar differs)
COPY --from=build /app/target/*.jar /app/app.jar

# Render sets $PORT. Spring Boot must listen on it.
ENV PORT=8080
EXPOSE 8080

# Pass the port down to Spring Boot
ENTRYPOINT ["sh", "-c", "java -Dserver.port=${PORT} -jar /app/app.jar"]
