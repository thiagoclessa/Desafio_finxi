from openjdk:12-alpine
COPY ./ipaas-log-app-0.0.1-SNAPSHOT.jar /app/ipaas-log-app-0.0.1-SNAPSHOT.jar
WORKDIR /app
ENTRYPOINT ["java", "-jar", "ipaas-log-app-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080