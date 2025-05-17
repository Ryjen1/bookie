# Stage 1: Build the app
FROM eclipse-temurin:21-jdk as builder

WORKDIR /app

# Copy Maven files
COPY pom.xml .
COPY src ./src

# Download dependencies and build the app
RUN chmod +x mvnw && \
    ./mvnw dependency:resolve && \
    ./mvnw clean package

# Stage 2: Create the runtime image
FROM eclipse-temurin:21-jre-slim

WORKDIR /app

# Copy the built JAR from the builder stage
COPY --from=builder /app/target/webApp-0.0.1-SNAPSHOT.jar app.jar

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]





