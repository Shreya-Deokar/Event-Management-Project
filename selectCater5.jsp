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
String name = request.getParameter("iname");
%>

<!DOCTYPE HTML>

<html>

<head>

<title>Catering</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<style>
body{
		background-color:pink;
}
</style>

</head>

<body bgcolor="pink">

<%session.getAttribute("id");%>


<%

try
{
	String query1 = "insert into Menu(eid) values ('"+session.getAttribute("id")+"')";
	statement.executeUpdate(query1);
%>

<%
} catch (Exception e) {
e.printStackTrace();
}
%>

<%

try
{
	String query2 = "select * from Menu where eid = '"+session.getAttribute("id")+"'";
	resultSet = statement.executeQuery(query2);
	while(resultSet.next()){
%>

<%session.setAttribute("menuId",resultSet.getString("meid"));%>

<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>

<%response.sendRedirect("selectCater.jsp");%>

<br><br>	

</body>