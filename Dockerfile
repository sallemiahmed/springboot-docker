<<<<<<< HEAD
# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the executable jar file into the container
COPY target/springboot-docker-1.0-SNAPSHOT.jar app.jar

# Expose the port the application runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

=======
# Use a Maven image to build the application
FROM maven:3.8.4-openjdk-17 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the project files to the container
COPY ./src /app/src
COPY ./pom.xml /app

# Build the Spring Boot application
RUN mvn clean package -DskipTests

# Use an OpenJDK runtime as the final image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Spring Boot jar from the build stage
COPY --from=build /app/target/*.jar /app/spring-boot-docker.jar

# Run the Spring Boot application
CMD ["java", "-jar", "spring-boot-docker.jar"]
>>>>>>> 27482c1 (Initial commit of Spring Boot Docker project)
