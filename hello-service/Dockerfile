#helloService
FROM openjdk:21-jdk-slim

WORKDIR /helloService
COPY target/hello-service-0.0.1-SNAPSHOT.jar helloService.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "helloService.jar"]
