FROM maven:3.8.7-eclipse-temurin-17-alpine AS maven
LABEL MAINTAINER="luci.federico.21@gmail.com"

WORKDIR /usr/src/app
COPY . /usr/src/app

RUN mvn package

FROM khipu/openjdk17-alpine

ARG JAR_FILE=backend-interview

WORKDIR /opt/app

COPY --from=maven /usr/src/app/target/${JAR_FILE} /opt/app/

ENTRYPOINT ["java","-jar","backend-interview"]