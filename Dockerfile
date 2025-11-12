cat > Dockerfile <<'EOF'
# Use a stable Java runtime
FROM eclipse-temurin:17-jre

# Copy compiled jar from Maven target into the container (adjust name if different)
COPY target/hello-world-1.0.jar /app/hello.jar

# Run the jar file
ENTRYPOINT ["java", "-jar", "/app/hello.jar"]
EOF
