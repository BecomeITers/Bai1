# Sử dụng một image có JDK để biên dịch mã nguồn Java
FROM openjdk:11-jdk-slim AS build

# Đặt thư mục làm việc trong container
WORKDIR /app

# Sao chép mã nguồn của bạn vào container
COPY . /app

# Biên dịch mã nguồn Java
RUN javac -d /app/src/main/webapp/WEB-INF/classes $(find /app/src/main/java -name "*.java")

# Sử dụng một image Tomcat để chạy ứng dụng đã được biên dịch
FROM tomcat:9-jdk11-openjdk-slim

# Xóa các file mặc định trong webapps của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Sao chép các file .html, .css và các file đã biên dịch vào Tomcat
COPY --from=build /app/src/main/webapp /usr/local/tomcat/webapps/ROOT

# Mở cổng mặc định của Tomcat
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]