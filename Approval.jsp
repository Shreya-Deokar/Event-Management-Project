<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
try 
{
	Class.forName("org.postgresql.Driver");
} 
catch (ClassNotFoundException e) 
{
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
ResultSet resultSet1 = null;
ResultSet resultSet2 = null;
connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
statement=connection.createStatement();

String id = request.getParameter("id");

%>

<!DOCTYPE HTML>

<html>

<head>


<style>

</style>

</head>

<body>

<%

try
{
   String sql1 = "update event set Approval='Approved' where eid='"+id+"'";
   statement.executeUpdate(sql1);

%>

<%
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<%response.sendRedirect("CustBookings.jsp");%>

</body>

</html>