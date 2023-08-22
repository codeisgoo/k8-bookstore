FROM maven:3.5.0-jdk-8-alpine AS builder
COPY . .
ADD ./pom.xml pom.xml
ADD ./src src/
RUN mvn clean package

FROM tomcat:8.5-jre8
COPY --from=builder /target/onlinebookstore.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
