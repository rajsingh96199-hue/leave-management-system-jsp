package com.leave;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;


public class UpdateLeaveStatusServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get leave ID from URL
            int leaveId = Integer.parseInt(request.getParameter("id"));

            // Get status from URL
            String status = request.getParameter("status");

            Connection con = DBConnection.getConnection();

            PreparedStatement pst = con.prepareStatement(
                "UPDATE leave_request SET status=? WHERE leave_id=?"
            );

            pst.setString(1, status);
            pst.setInt(2, leaveId);

            pst.executeUpdate();

            response.sendRedirect("manageLeaves.jsp");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
