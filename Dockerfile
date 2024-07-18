FROM openjdk:8-jre-alpine
EXPOSE 8080
COPY ./target/my-app-1.0-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app

ENTRYPOINT["jar", "-jar", "my-app-1.0-SNAPSHOT.jar"]