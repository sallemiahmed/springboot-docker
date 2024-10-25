# Stage 1: Build the application
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package -DskipTests

# Stage 2: Create a minimal image with just the JAR
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/springboot-docker-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
