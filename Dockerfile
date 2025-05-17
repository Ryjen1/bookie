# Use Eclipse Temurin JDK 21
FROM eclipse-temurin:21-jdk-jammy

# Set working directory
WORKDIR /app

# Install Maven
RUN apt-get update && \
    apt-get install -y maven

# Copy Maven files
COPY pom.xml .
COPY src ./src

# Build the app inside the container
RUN mkdir -p target && \
    mvn clean package -DskipTests

# Run the app
ENTRYPOINT ["java", "-jar", "target/webApp-0.0.1-SNAPSHOT.jar"]