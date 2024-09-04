#worldService
FROM openjdk:21-jdk-slim

WORKDIR /worldService
COPY target/world-service-0.0.1-SNAPSHOT.jar worldService.jar
EXPOSE 8082
ENTRYPOINT ["java", "-jar", "worldService.jar"]
