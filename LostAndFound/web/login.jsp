<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <script>
        function toggleLoginForm() {
            var userType = document.getElementById("loginType").value;
            document.getElementById("studentLogin").style.display = userType === "Student" ? "block" : "none";
            document.getElementById("securityLogin").style.display = userType === "Security Officer" ? "block" : "none";
        }
    </script>
</head>
<body>
    <h2>Login</h2>
    <form action="LoginServlet" method="post">
        <label>Login as:</label>
        <select id="loginType" name="loginType" onchange="toggleLoginForm()">
            <option value="Student">Student</option>
            <option value="Security Officer">Security Officer</option>
        </select>

        <div id="studentLogin">
            <label>Registration Number:</label> <input type="text" name="regNumber" required><br>
        </div>

        <div id="securityLogin" style="display:none;">
            <label>Staff Number:</label> <input type="text" name="staffNumber" required><br>
        </div>

        <label>Password:</label> <input type="password" name="password" required><br>

        <input type="submit" value="Login">
    </form>
</body>
</html>
