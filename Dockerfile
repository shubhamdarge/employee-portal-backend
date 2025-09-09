# --- Build stage: Maven + JDK 8
FROM maven:3-eclipse-temurin-8 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -q -DskipTests dependency:go-offline
COPY src ./src
RUN mvn -q -DskipTests package

# --- Runtime stage: JRE 8
FROM eclipse-temurin:8-jre
WORKDIR /app
# copy the fat jar built above (adjust if your target produces multiple jars)
COPY --from=build /app/target/*.jar /app/app.jar

# Render provides $PORT; pass it to Spring Boot
ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["sh", "-c", "java -Dserver.port=${PORT} -jar /app/app.jar"]
