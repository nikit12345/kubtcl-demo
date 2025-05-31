FROM openjdk:17-jdk-slim
ADD target/testKubernet.jar testKubernet.jar
ENTRYPOINT ["java", "-jar", "testKubernet.jar"]
