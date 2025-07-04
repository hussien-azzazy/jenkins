# Build stage
FROM gradle:jdk21-corretto AS build

WORKDIR /app
COPY . .

# Use Gradle to build the application
RUN gradle clean build

# Run stage
FROM openjdk:21-jdk-slim  
EXPOSE 8080
WORKDIR /usr/app
COPY --from=build /app/build/libs/java-gradle-app-*.jar /usr/app/

CMD ["java", "-jar", "java-gradle-app-*.jar"]