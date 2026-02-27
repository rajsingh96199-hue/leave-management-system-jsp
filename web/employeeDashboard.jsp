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
<title>Employee Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="card shadow">
        <div class="card-header bg-success text-white">
            <h4>Employee Dashboard</h4>
        </div>

        <div class="card-body text-center">

            <h5>Welcome, <%= session.getAttribute("name") %></h5>

            <div class="mt-4">
                <a href="applyLeave.jsp" class="btn btn-primary m-2">Apply Leave</a>
                <a href="viewLeave.jsp" class="btn btn-info m-2">View Leaves</a>
                <a href="LogoutServlet" class="btn btn-danger m-2">Logout</a>
            </div>

        </div>
    </div>

</div>

</body>
</html>
