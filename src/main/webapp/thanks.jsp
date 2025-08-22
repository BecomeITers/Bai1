<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thanks</title>
    <link rel="stylesheet" href="style.css" type="text/css"/>
</head>
<body>
    <h1>Thanks for joining our email list</h1>

    <p>Here is the information that you entered:</p>

    <p>
        <label>Email:</label>
        <span>${user.email}</span><br/>

        <label>First Name:</label>
        <span>${user.firstName}</span><br/>

        <label>Last Name:</label>
        <span>${user.lastName}</span>
    </p>

    <p>To enter another email address, click the button below:</p>

    <!-- Quay lại trang form -->
    <form action="index.html" method="get">
        <input type="submit" value="Return"/>
    </form>
</body>
</html>
