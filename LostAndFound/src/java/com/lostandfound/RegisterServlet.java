package com.lostandfound;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userType = request.getParameter("userType");
        String name = null;
        String identifier = null;

        // Retrieve name and identifier based on user type
        if ("Student".equals(userType)) {
            name = request.getParameter("studentName");
            identifier = request.getParameter("regNumber");
        } else if ("Security Officer".equals(userType)) {
            name = request.getParameter("securityName");
            identifier = request.getParameter("staffNumber");
        }

        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // Ensure the file path is valid
        File file = new File(getServletContext().getRealPath("/data/users.txt"));
        file.getParentFile().mkdirs(); // Ensure the parent directory exists

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(file, true))) {
            bw.write(userType + "," + name + "," + identifier + "," + phone + "," + password);
            bw.newLine();
        }

        response.sendRedirect("login.jsp");
    }
}
