# Build stage: uses Maven + JDK 17 to compile your Spring MVC WAR
FROM maven:3.9-amazoncorretto-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Runtime stage: Tomcat 9 supports JSP + Servlet API you use
FROM tomcat:9.0-jdk17

# Remove default Tomcat ROOT app
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR as the ROOT application
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
