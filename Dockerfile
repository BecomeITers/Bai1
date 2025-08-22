# Stage 1: Build - Compile Java source code
# Correct image name
FROM eclipse-temurin:21-jdk-slim AS builder

# Set the working directory
WORKDIR /app

# Copy all project files into the container
COPY . .

# Compile all Java files and place them in the correct directory
RUN javac -d /app/src/main/webapp/WEB-INF/classes $(find /app/src/main/java -name "*.java")

# Stage 2: Runtime - Run the application with Tomcat
# Use the correct Tomcat image with a compatible JDK
FROM tomcat:10.1-jdk21-temurin

# Remove default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your webapp content from the builder stage into Tomcat's webapps directory
COPY --from=builder /app/src/main/webapp /usr/local/tomcat/webapps/ROOT

# Expose the port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
