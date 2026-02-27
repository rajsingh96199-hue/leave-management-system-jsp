Leave Management System – JSP & Servlet
Overview

The Leave Management System is a web-based application developed using JSP and Servlets that allows employees to apply for leave and administrators to manage and approve leave requests.

The system follows a structured MVC-style approach where JSP handles the presentation layer, Servlets manage business logic, and MySQL stores application data.

Tech Stack


Backend

Java (Servlet API)
JDBC
Apache Tomcat


Frontend

JSP
HTML
CSS


Database

MySQL
Development Environment
NetBeans IDE (Ant-based Web Project)


Features

User Registration and Login
Session-based Authentication
Apply for Leave
View Leave Status


Admin Dashboard

Approve / Reject Leave Requests
Logout Functionality
Architecture

Client (JSP Pages) → Servlets (Controller Layer) → JDBC → MySQL Database

JSP handles UI rendering

Servlets process requests and business logic

JDBC manages database connectivity

MySQL stores user and leave data



How to Run
Requirements

JDK 8 or higher

Apache Tomcat (8 or 9)

MySQL Server

NetBeans IDE (or any Java IDE)

Database Setup


Create the database:

CREATE DATABASE leave_management;

Update database credentials inside DBConnection.java.

Deployment

Open the project in NetBeans

Configure Apache Tomcat

Build and run the project

Access in browser:

http://localhost:8080/ProjectName


Security Implementation

Session-based authentication

Role-based access control (Admin / Employee)

JDBC-based database integration

Future Improvements

Email notifications for leave approval

Leave balance tracking

Report generation (PDF / Excel)

Migration to Spring Boot for scalability

Author 
Raj Singh
BSc Computer Science Student

Raj Singh
BSc Computer Science Student
