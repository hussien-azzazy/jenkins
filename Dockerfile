# Build stage
FROM gradle:7.5-jdk21 AS build  
WORKDIR /app
COPY . .
RUN gradle clean build  

# Run stage
FROM openjdk:21-jdk-slim  
EXPOSE 8080
WORKDIR /usr/app
COPY --from=build /app/build/libs/java-gradle-app-*.jar /usr/app/
CMD ["java", "-jar", "java-gradle-app-*.jar"]