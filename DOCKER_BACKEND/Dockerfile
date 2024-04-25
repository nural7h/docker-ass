FROM maven:3-eclipse-temurin-19-alpine AS build
RUN apk update && apk add binutils
RUN mkdir -p /app
WORKDIR /app
COPY pom.xml /app
COPY src /app/src
RUN mvn -B package --file pom.xml -DskipTests

# Create small run time image
FROM eclipse-temurin:17-jre-alpine
# Expose port 8080
EXPOSE 8080
COPY --from=build /app/target/doc-ass-0.0.1-SNAPSHOT.jar doc-ass-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","doc-ass-0.0.1-SNAPSHOT.jar"]