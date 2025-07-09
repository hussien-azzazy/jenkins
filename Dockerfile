FROM gradle:7.5.1-jdk17 AS builder
COPY . /home/app
WORKDIR /home/app
RUN gradle build --no-daemon

FROM openjdk:17
COPY --from=builder /home/app/build/libs/*.jar /app/app.jar
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
