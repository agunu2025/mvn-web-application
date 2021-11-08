#git
FROM alpine/git as repo

MAINTAINER agunu2025@gmail.com

WORKDIR /app
RUN git clone https://github.com/agunu2025/testing.git

#Maven
FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=repo /app/testing  /app
RUN mvn install
ARG branchName=master
LABEL branchName ${branchName}


#Tomcat
FROM tomcat:8.0.20-jre8
ARG warName=maven-web-application.war
COPY --from=build /app/target/${warName} /usr/local/tomcat/webapps/maven-web-application.war
