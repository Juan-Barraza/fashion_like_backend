# Etapa 1: Compilación con Maven
FROM maven:3.8.5-openjdk-17-slim AS build
WORKDIR /app
# Copia el archivo pom.xml y descarga las dependencias
COPY pom.xml .
RUN mvn dependency:go-offline -B
# Copia el código fuente y compila el proyecto
COPY src ./src
RUN mvn clean package -DskipTests

# Etapa 2: Imagen final con OpenJDK
FROM openjdk:17-jdk-slim
WORKDIR /app
# Copia el jar generado en la etapa anterior
COPY --from=build /app/target/backendFashion-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
