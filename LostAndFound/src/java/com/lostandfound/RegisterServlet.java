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
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        String identifier = userType.equals("Student") ? request.getParameter("regNumber") : request.getParameter("staffNumber");

        File file = new File(getServletContext().getRealPath("/data/users.txt"));
        FileWriter fw = new FileWriter(file, true);
        BufferedWriter bw = new BufferedWriter(fw);
        bw.write(userType + "," + name + "," + identifier + "," + phone + "," + password);
        bw.newLine();
        bw.close();

        response.sendRedirect("login.jsp");
    }
}
