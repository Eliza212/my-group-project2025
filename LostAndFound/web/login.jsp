<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <script>
        function toggleLoginForm() {
            var userType = document.getElementById("loginType").value;
            var studentLogin = document.getElementById("studentLogin");
            var securityLogin = document.getElementById("securityLogin");
            var regNumber = document.getElementsByName("regNumber")[0];
            var staffNumber = document.getElementsByName("staffNumber")[0];

            if (userType === "Student") {
                studentLogin.style.display = "block";
                securityLogin.style.display = "none";
                regNumber.required = true;
                staffNumber.required = false;
                staffNumber.value = ""; // Clear hidden field value
            } else {
                studentLogin.style.display = "none";
                securityLogin.style.display = "block";
                regNumber.required = false;
                staffNumber.required = true;
                regNumber.value = ""; // Clear hidden field value
            }
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
            <label>Registration Number:</label> 
            <input type="text" name="regNumber"><br>
        </div>

        <div id="securityLogin" style="display:none;">
            <label>Staff Number:</label> 
            <input type="text" name="staffNumber"><br>
        </div>

        <label>Password:</label> 
        <input type="password" name="password" required><br>

        <input type="submit" value="Login">
    </form>
</body>
</html>
