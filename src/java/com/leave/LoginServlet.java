package com.leave;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Get form values
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {

            // Get database connection
            Connection con = DBConnection.getConnection();

            // SQL query to check user
            PreparedStatement pst = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?"
            );

            pst.setString(1, email);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                // Create session
                HttpSession session = request.getSession();

                session.setAttribute("userId", rs.getInt("user_id"));
                session.setAttribute("name", rs.getString("name"));
                session.setAttribute("role", rs.getString("role"));

                // Redirect based on role
                if ("ADMIN".equals(rs.getString("role"))) {
                    response.sendRedirect("adminDashboard.jsp");
                } else {
                    response.sendRedirect("employeeDashboard.jsp");
                }

            } else {
                // Invalid login
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
