# Use the official OpenJDK 17 base image
FROM openjdk:17

# Set working directory inside container
WORKDIR /app

# Create a volume for /tmp (optional but often done for Spring Boot)
VOLUME /tmp

# Accept the JAR file as a build argument (during build time)
ARG JAR_FILE=target/testKubernet.jar

# Copy the JAR file into the container and rename it to app.jar
COPY target/*jar /opt/testKubernet.jar


# Copy a TAR file (native libraries?) into the container
COPY Testtt.tar .

# Create lib directory and extract TAR file contents into it
RUN mkdir -p /app/lib && tar -xf Testtt.tar -C /app/lib

# Set environment variable for shared library path
ENV LD_LIBRARY_PATH=/app/lib:${LD_LIBRARY_PATH}

# Set the startup command (entrypoint) to run the JAR with native libraries
ENTRYPOINT ["java", "-Djava.library.path=/app/lib", "-jar", "/opt/testKubernet.jar"]
