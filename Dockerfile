FROM openjdk:21
EXPOSE 8080
ADD target/jenkins-devops-integration.jar jenkins-devops-integration.jar
ENTRYPOINT ["java","-jar","/jenkins-devops-integration.jar"]