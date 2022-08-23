
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

<title>Book An Event</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<style>

	.button {
		border: none;
		color: white;
		padding: 15px 32px;
		text-align: center;
		display: inline-block;
		font-size: 16px;
		margin-top:50px;
		margin-left: 400px;
		cursor: pointer;
	}
	
	.button1 {background-color: #008CBA;}
	.button2 {background-color: #008CBA;}
	body{
		background-color:pink;
	}


</style>

</head>

<body bgcolor="pink">

<h2>Book Your Event Type..</h2>

<a href="eventDetail.jsp"> <button class="button button1">Social Events</button> </a>
<a href="corporateEvents.jsp"> <button class="button button2">Corporate Events</button> </a>

</body>

</html>