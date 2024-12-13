# Build stage using Maven
FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

# Runtime stage with OpenJDK 17
FROM openjdk:17.0.1-jdk-slim

# Copy the JAR file from the build stage
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar

# Copy the wait-for-it.sh script to the container
COPY wait-for-it.sh /wait-for-it.sh

# Make the wait-for-it.sh script executable
RUN chmod +x /wait-for-it.sh

# Expose port 8080 (default for Spring Boot)
EXPOSE 8080

# Entry point: first wait for MySQL to be available, then start the Spring Boot app
ENTRYPOINT ["/wait-for-it.sh", "mysql-container:3306", "--", "java", "-jar", "demo.jar"]
