FROM openjdk:17-oracle

WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

RUN chmod +x ./mvnw


# Converting the mvnw line endings during build (if you don’t change line endings of the mvnw file)
RUN apk update && apk add -y dos2unix
RUN dos2unix ./mvnw

RUN ./mvnw dependency:resolve

COPY src ./src

CMD ["./mvnw", "spring-boot:run"]