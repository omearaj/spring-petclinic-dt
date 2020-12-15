#FROM java:8-alpine
FROM openjdk:8
ADD ./spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar /spring-petclinic.jar

RUN sh -c 'touch /hello-boot.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/spring-petclinic.jar"]
