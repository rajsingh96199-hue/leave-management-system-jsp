package com.leave;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;


public class ApplyLeaveServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get logged in user ID from session
            HttpSession session = request.getSession();
            int userId = (int) session.getAttribute("userId");

            // Get form data
            String leaveType = request.getParameter("leaveType");
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            String reason = request.getParameter("reason");

            // Database connection
            Connection con = DBConnection.getConnection();

            PreparedStatement pst = con.prepareStatement(
                "INSERT INTO leave_request (user_id, leave_type, from_date, to_date, reason) VALUES (?,?,?,?,?)"
            );

            pst.setInt(1, userId);
            pst.setString(2, leaveType);
            pst.setString(3, fromDate);
            pst.setString(4, toDate);
            pst.setString(5, reason);

            pst.executeUpdate();

            response.sendRedirect("viewLeave.jsp");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
