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


%>


<!DOCTYPE HTML>

<html>

<head>

<title></title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>
body{
		background-color:pink;
}
</style>

</head>

<body bgcolor="pink">
<%=session.getAttribute("id")%>
<%=session.getAttribute("total")%>

<%

try{
	String sql ="update event set total_price = '"+session.getAttribute("total")+"' where eid = '"+session.getAttribute("id")+"'";
	statement.executeUpdate(sql);

%>


<%
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


<%
 request.setAttribute("message", "Your Event is Booked.Confirmation will come soon");
response.sendRedirect("customer_page.jsp"+message);
%>

</body>

</html>