<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
    <script>
        function toggleForm() {
            var userType = document.getElementById("userType").value;
            var studentFields = document.getElementById("studentFields");
            var securityFields = document.getElementById("securityFields");

            if (userType === "Student") {
                studentFields.style.display = "block";
                securityFields.style.display = "none";

                document.querySelectorAll("#studentFields input").forEach(input => input.removeAttribute("disabled"));
                document.querySelectorAll("#securityFields input").forEach(input => input.setAttribute("disabled", "true"));
            } else {
                studentFields.style.display = "none";
                securityFields.style.display = "block";

                document.querySelectorAll("#securityFields input").forEach(input => input.removeAttribute("disabled"));
                document.querySelectorAll("#studentFields input").forEach(input => input.setAttribute("disabled", "true"));
            }
        }

        window.onload = toggleForm;
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
            <label>Name:</label> <input type="text" name="studentName" required><br>
            <label>Registration Number:</label> <input type="text" name="regNumber" required><br>
        </div>
        
        <div id="securityFields" style="display:none;">
            <label>Name:</label> <input type="text" name="securityName" required><br>
            <label>Staff Number:</label> <input type="text" name="staffNumber" required><br>
        </div>
        
        <label>Phone Number:</label> <input type="text" name="phone" required><br>
        <label>Password:</label> <input type="password" name="password" required><br>
        <label>Confirm Password:</label> <input type="password" name="confirmPassword" required><br>

        <input type="submit" value="Register">
    </form>
    <jsp:include page="footer.jsp" />

</body>
</html>
