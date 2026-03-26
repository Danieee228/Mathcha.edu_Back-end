
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

ENV SERVER_PORT=10000
EXPOSE 10000

# Lệnh khởi động server
ENTRYPOINT ["java", "-jar", "app.jar"]