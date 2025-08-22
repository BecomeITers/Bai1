FROM tomcat:10.1-jdk21-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
# Nếu WAR nằm cạnh Dockerfile
COPY Bai1.war /usr/local/tomcat/webapps/ROOT.war
# (hoặc nếu ở target/) COPY target/Bai1.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
