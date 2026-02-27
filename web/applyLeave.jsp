<%@ page import="com.leave.DBConnection" %>
<%@ page import="java.sql.*" %>

<%
    if(session.getAttribute("userId") == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apply Leave</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-info text-white">
            <h4>Apply Leave</h4>
        </div>

        <div class="card-body">

            <form action="ApplyLeaveServlet" method="post">

                <div class="mb-3">
                    <label>Leave Type</label>
                    <select name="leaveType" class="form-select" required>
                        <option>Sick Leave</option>
                        <option>Casual Leave</option>
                        <option>Vacation</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label>From Date</label>
                    <input type="date" name="fromDate" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label>To Date</label>
                    <input type="date" name="toDate" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label>Reason</label>
                    <textarea name="reason" class="form-control" required></textarea>
                </div>

                <button type="submit" class="btn btn-info">Submit</button>
                <a href="employeeDashboard.jsp" class="btn btn-secondary">Back</a>

            </form>

        </div>
    </div>
</div>

</body>
</html>
