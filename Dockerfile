FROM maven:3.5.4-jdk-8-alpine as maven
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn dependency:go-offline -B
RUN mvn package
FROM openjdk:8u171-jre-alpine
WORKDIR /javamavenProject
COPY --from=maven target/*.jar ./javamavenProject/SimpleMavenProject.jar
CMD ["java", "-jar", "./javamavenProject/SimpleMavenProject.jar"]
