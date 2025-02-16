package com.lostandfound;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String phone = request.getParameter("phone");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            response.getWriter().write("<script>alert('Passwords do not match. Try again.'); window.history.back();</script>");
            return;
        }

        File file = new File(getServletContext().getRealPath("/data/users.txt"));
        if (!file.exists()) {
            response.getWriter().write("<script>alert('User database not found.'); window.history.back();</script>");
            return;
        }

        // Read the file and update password
        File tempFile = new File(file.getAbsolutePath() + ".tmp");
        boolean found = false;

        try (BufferedReader br = new BufferedReader(new FileReader(file));
             BufferedWriter bw = new BufferedWriter(new FileWriter(tempFile))) {

            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 5 && parts[3].equals(phone)) {
                    parts[4] = newPassword; // Update password
                    found = true;
                }
                bw.write(String.join(",", parts));
                bw.newLine();
            }
        }

        if (!found) {
            response.getWriter().write("<script>alert('Phone number not found.'); window.history.back();</script>");
            return;
        }

        // Replace old file with updated file
        if (!file.delete() || !tempFile.renameTo(file)) {
            response.getWriter().write("<script>alert('Error updating password.'); window.history.back();</script>");
            return;
        }

        response.getWriter().write("<script>alert('Password reset successfully!'); window.location='login.jsp';</script>");
    }
}
