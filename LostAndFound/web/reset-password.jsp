<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Reset Password</title>
</head>
<body>
    <h2>Reset Password</h2>
    <form action="ResetPasswordServlet" method="post">
        <label>Enter Phone Number:</label>
        <input type="text" name="phone" required><br>

        <label>New Password:</label>
        <input type="password" name="newPassword" required><br>

        <label>Confirm New Password:</label>
        <input type="password" name="confirmPassword" required><br>

        <input type="submit" value="Reset Password">
    </form>
    <jsp:include page="footer.jsp" />

</body>
</html>
