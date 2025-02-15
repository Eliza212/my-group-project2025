package com.lostandfound;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String loginType = request.getParameter("loginType");
        String identifier = loginType.equals("Student") ? request.getParameter("regNumber") : request.getParameter("staffNumber");
        String password = request.getParameter("password");

        File file = new File(getServletContext().getRealPath("/data/users.txt"));
        BufferedReader br = new BufferedReader(new FileReader(file));
        String line;
        boolean validUser = false;

        while ((line = br.readLine()) != null) {
            String[] details = line.split(",");
            if (details[0].equals(loginType) && details[2].equals(identifier) && details[4].equals(password)) {
                validUser = true;
                break;
            }
        }
        br.close();

        if (validUser) {
            response.sendRedirect("welcome.jsp");
        } else {
            response.sendRedirect("login.jsp?error=Invalid credentials");
        }
    }
}
