# Stage 1: Build the project with Maven
FROM maven:3.8.3-openjdk-17 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the project files (pom.xml and the src folder) to the container
COPY pom.xml .
COPY src ./src

# Build the project and package it into a JAR file
RUN mvn clean package -DskipTests

# Stage 2: Run the packaged JAR using a lighter OpenJDK image
FROM openjdk:17-jdk-alpine

# Set the working directory for the runtime container
WORKDIR /app

# Copy the JAR file from the 'builder' stage to this stage
COPY --from=builder /app/target/usercrud-0.0.1-SNAPSHOT.jar /app/usercrud.jar

# Expose port 8080 for the Spring Boot application
EXPOSE 8080

# Define the command to run the application using the JAR
ENTRYPOINT ["java", "-jar", "/app/usercrud.jar"]