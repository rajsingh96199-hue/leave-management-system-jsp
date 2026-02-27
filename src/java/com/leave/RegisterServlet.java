package com.leave;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {

            System.out.println("Register button clicked");

            Connection con = DBConnection.getConnection();

            if (con == null) {
                out.println("<h2>Database Connection Failed</h2>");
                return;
            }

            PreparedStatement pst = con.prepareStatement(
                "INSERT INTO users (name, email, password, role) VALUES (?,?,?,?)"
            );

            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, password);
            pst.setString(4, role);

            int result = pst.executeUpdate();

            if (result > 0) {
                System.out.println("User inserted successfully");
                response.sendRedirect("login.jsp");
            } else {
                out.println("<h2>Registration Failed</h2>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error Occurred:</h2>");
            out.println("<pre>" + e.getMessage() + "</pre>");
        }
    }
}
