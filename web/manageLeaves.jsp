<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.leave.DBConnection" %>
<%@ page import="java.sql.*" %>

<%
    if(session.getAttribute("userId") == null){
        response.sendRedirect("login.jsp");
        return;
    }

    Connection con = DBConnection.getConnection();

    PreparedStatement pst = con.prepareStatement(
        "SELECT l.*, u.name FROM leave_request l JOIN users u ON l.user_id = u.user_id"
    );

    ResultSet rs = pst.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Leaves</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="card shadow-lg">
        <div class="card-header bg-dark text-white d-flex justify-content-between">
            <h4 class="mb-0">Leave Management</h4>
            <a href="adminDashboard.jsp" class="btn btn-light btn-sm">Back</a>
        </div>

        <div class="card-body">

            <table class="table table-hover table-bordered align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Employee</th>
                        <th>Leave Type</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Reason</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

                <%
                while(rs.next()){
                %>

                    <tr>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("leave_type") %></td>
                        <td><%= rs.getDate("from_date") %></td>
                        <td><%= rs.getDate("to_date") %></td>
                        <td><%= rs.getString("reason") %></td>

                        <td>
                            <%
                                String status = rs.getString("status");
                                String badgeClass = "bg-secondary";

                                if("APPROVED".equals(status)) badgeClass = "bg-success";
                                else if("REJECTED".equals(status)) badgeClass = "bg-danger";
                                else if("PENDING".equals(status)) badgeClass = "bg-warning text-dark";
                            %>

                            <span class="badge <%= badgeClass %>">
                                <%= status %>
                            </span>
                        </td>

                        <td>
                            <a href="UpdateLeaveStatusServlet?id=<%= rs.getInt("leave_id") %>&status=APPROVED"
                               class="btn btn-success btn-sm">Approve</a>

                            <a href="UpdateLeaveStatusServlet?id=<%= rs.getInt("leave_id") %>&status=REJECTED"
                               class="btn btn-danger btn-sm">Reject</a>
                        </td>
                    </tr>

                <%
                }
                %>

                </tbody>
            </table>

        </div>
    </div>

</div>

</body>
</html>
