FROM openjdk:18-jdk
EXPOSE 8081
ARG JAR_FILE=./target/librarymanagementsystem-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} .
CMD [ "java", "-jar", "/librarymanagementsystem-0.0.1-SNAPSHOT.jar"]