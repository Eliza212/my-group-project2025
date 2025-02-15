<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
    <script>
        function toggleForm() {
            var userType = document.getElementById("userType").value;
            document.getElementById("studentFields").style.display = userType === "Student" ? "block" : "none";
            document.getElementById("securityFields").style.display = userType === "Security Officer" ? "block" : "none";
        }
    </script>
</head>
<body>
    <h2>Register</h2>
    <form action="RegisterServlet" method="post">
        <label>Select Role:</label>
        <select id="userType" name="userType" onchange="toggleForm()">
            <option value="Student">Student</option>
            <option value="Security Officer">Security Officer</option>
        </select>
        
        <div id="studentFields">
            <label>Name:</label> <input type="text" name="name" required><br>
            <label>Registration Number:</label> <input type="text" name="regNumber" required><br>
        </div>
        
        <div id="securityFields" style="display:none;">
            <label>Name:</label> <input type="text" name="name" required><br>
            <label>Staff Number:</label> <input type="text" name="staffNumber" required><br>
        </div>
        
        <label>Phone Number:</label> <input type="text" name="phone" required><br>
        <label>Password:</label> <input type="password" name="password" required><br>
        <label>Confirm Password:</label> <input type="password" name="confirmPassword" required><br>

        <input type="submit" value="Register">
    </form>
</body>
</html>
