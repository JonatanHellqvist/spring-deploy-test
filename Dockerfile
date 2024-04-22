FROM eclipse-temurin:17-jdk-jammy as builder
WORKDIR /opt/app
COPY .mvn/ .mvn
COPY mvnw ./
COPY mvnw.cmd ./
COPY pom.xml ./
COPY . .   
# Kör Maven-wrapperfilen för att bygga projektet
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:17-jre-jammy
WORKDIR /opt/app
EXPOSE 8080
COPY --from=builder /opt/app/target/*.jar /opt/app/*.jar
ENTRYPOINT ["java","-Dspring.profiles.active=prod", "-jar", "/opt/app/*.jar" ]




# FROM eclipse-temurin:17-jdk-jammy as builder
# WORKDIR /opt/app
# COPY .mvn/ .mvn
# COPY mvnw pom.xml ./
# # RUN chmod +x mvnw  # Gör mvnw filen körbar
# RUN ./mvnw dependency:go-offline
# COPY ./src ./src
# RUN ./mvnw clean install -DskipTests

# FROM eclipse-temurin:17-jre-jammy
# WORKDIR /opt/app
# EXPOSE 8080
# COPY --from=builder /opt/app/target/*.jar /opt/app/*.jar
# ENTRYPOINT ["java","-Dspring.profiles.active=prod", "-jar", "/opt/app/*.jar" ]