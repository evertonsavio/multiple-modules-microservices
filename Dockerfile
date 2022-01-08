# cache as most as possible in this multistage dockerfile.
FROM maven:3.6.3-jdk-11-slim as deps

WORKDIR /opt/app
COPY app-config-data/pom.xml app-config-data/pom.xml
COPY main-service/pom.xml main-service/pom.xml

# you get the idea:
# COPY moduleN/pom.xml moduleN/pom.xml

COPY pom.xml .
RUN mvn -B -e -C org.apache.maven.plugins:maven-dependency-plugin:3.1.2:go-offline -DexcludeArtifactIds=app-config-data

# if you have modules that depends each other, you may use -DexcludeArtifactIds as follows
# RUN mvn -B -e -C org.apache.maven.plugins:maven-dependency-plugin:3.1.2:go-offline -DexcludeArtifactIds=app-config-data

# Copy the dependencies from the DEPS stage with the advantage
# of using docker layer caches. If something goes wrong from this
# line on, all dependencies from DEPS were already downloaded and
# stored in docker's layers.
FROM maven:3.6.3-jdk-11-slim as builder
WORKDIR /opt/app
COPY --from=deps /root/.m2 /root/.m2
COPY --from=deps /opt/app/ /opt/app
COPY app-config-data/src /opt/app/app-config-data/src
COPY main-service/src /opt/app/main-service/src

# use -o (--offline) if you didn't need to exclude artifacts.
# if you have excluded artifacts, then remove -o flag
RUN mvn -B -e clean install -DskipTests=true

# At this point, BUILDER stage should have your .jar or whatever in some path
WORKDIR /opt/app/main-service
RUN mvn -B -e clean install -DskipTests=true

FROM openjdk:11
WORKDIR /opt/app
COPY --from=builder /opt/app/main-service/target/*.jar /app/main-service.jar
EXPOSE 8080
CMD [ "java", "-jar", "/app/main-service.jar" ]