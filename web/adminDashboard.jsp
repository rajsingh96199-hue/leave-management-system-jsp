<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if(session.getAttribute("userId") == null){
        response.sendRedirect("login.jsp");
        return;
    }

    String role = (String) session.getAttribute("role");

    if(!"ADMIN".equals(role)){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="card shadow-lg">
        <div class="card-header bg-dark text-white d-flex justify-content-between">
            <h4 class="mb-0">Admin Dashboard</h4>
            <a href="LogoutServlet" class="btn btn-danger btn-sm">Logout</a>
        </div>

        <div class="card-body text-center">

            <h5 class="mb-4">Welcome, <%= session.getAttribute("name") %></h5>

            <div class="row justify-content-center">

                <div class="col-md-4">
                    <div class="card border-primary mb-3 shadow">
                        <div class="card-body">
                            <h5 class="card-title">Manage Leave Requests</h5>
                            <p class="card-text">
                                View, approve, or reject employee leave applications.
                            </p>
                            <a href="manageLeaves.jsp" class="btn btn-primary w-100">
                                Open Panel
                            </a>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>

</div>

</body>
</html>
