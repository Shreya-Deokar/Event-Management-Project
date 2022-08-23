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

<title>Forgot Password</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>
	input[type=submit],input[type=reset]
	{
		background-color:red;
	}
	body{
		background-color:pink;
	}
</style>

</head>

<body bgcolor="pink">
<%
String mail = request.getParameter("C_Mail");
String book = request.getParameter("C_Book");
String flower = request.getParameter("C_Flower");
String number = request.getParameter("C_Number");
%>
<%
	try
	{
	String sql ="select * from Customer where cmail='"+mail+"' and cbook='"+book+"' and cflower='"+flower+"' and cnumber='"+number+"'";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){

%>

<h3>Your Password is : <%=resultSet.getString("cpassword")%></h3>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<br><br><br>


</body>

</html>