# Giai đoạn 1: Build - Biên dịch mã nguồn Java
# Sử dụng JDK 24 để biên dịch, đảm bảo tương thích với mã nguồn của bạn
FROM eclipse-temurin:24-jdk-slim AS builder

# Thiết lập thư mục làm việc bên trong container
WORKDIR /app

# Sao chép toàn bộ mã nguồn của bạn vào container
COPY . .

# Biên dịch tất cả các file .java và đặt chúng vào đúng thư mục WEB-INF/classes
RUN javac -d /app/src/main/webapp/WEB-INF/classes $(find /app/src/main/java -name "*.java")

# Giai đoạn 2: Runtime - Chạy ứng dụng đã biên dịch
# Sử dụng Tomcat 10.1 với JDK 21 (Đây là phiên bản tương thích Jakarta EE)
FROM tomcat:10.1-jdk21-temurin

# Xóa các file mặc định trong webapps của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Sao chép các file web (HTML, CSS, JSP) và các file .class đã biên dịch vào thư mục gốc của Tomcat
COPY --from=builder /app/src/main/webapp /usr/local/tomcat/webapps/ROOT

# Mở cổng mặc định của Tomcat
EXPOSE 8080

<<<<<<< HEAD
# Chạy Tomcat khi container khởi động
CMD ["catalina.sh", "run"]
=======
# Start Tomcat
CMD ["catalina.sh", "run"]
>>>>>>> cdc2c63655c953d38598e18696f0f82d8af2aea8
