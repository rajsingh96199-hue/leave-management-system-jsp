<%@ page import="com.leave.DBConnection" %>
<%@ page import="java.sql.*" %>

<%
    if(session.getAttribute("userId") == null){
        response.sendRedirect("login.jsp");
        return;
    }

    int userId = (int) session.getAttribute("userId");
    Connection con = DBConnection.getConnection();
    PreparedStatement pst = con.prepareStatement(
        "SELECT * FROM leave_request WHERE user_id=?"
    );
    pst.setInt(1, userId);
    ResultSet rs = pst.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Leaves</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-dark text-white">
            <h4>My Leave Requests</h4>
        </div>

        <div class="card-body">

            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Type</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Reason</th>
                        <th>Status</th>
                    </tr>
                </thead>

                <tbody>
                <%
                while(rs.next()){
                %>
                    <tr>
                        <td><%= rs.getString("leave_type") %></td>
                        <td><%= rs.getDate("from_date") %></td>
                        <td><%= rs.getDate("to_date") %></td>
                        <td><%= rs.getString("reason") %></td>
                        <td><%= rs.getString("status") %></td>
                    </tr>
                <%
                }
                %>
                </tbody>
            </table>

            <a href="employeeDashboard.jsp" class="btn btn-secondary">Back</a>

        </div>
    </div>
</div>

</body>
</html>
