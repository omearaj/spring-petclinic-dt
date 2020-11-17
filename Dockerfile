#FROM java:8-alpine
FROM openjdk:8
ADD ./spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar /spring-petclinic.jar
ADD ./dd-java-agent-0.67.0.jar /dd-java-agent.jar
ENV DD_SERVICE=Petclinic
ENV DD_ENV=Production
ENV DD_VERSION=1.0
RUN sh -c 'touch /hello-boot.jar'
ENTRYPOINT ["java","-javaagent:dd-java-agent.jar","-Ddd.profiling.enabled=true","-Djava.security.egd=file:/dev/./urandom","-jar","/spring-petclinic.jar"]
