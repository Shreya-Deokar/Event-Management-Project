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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<title>Customer Bookings</title>

<style>

.feedback
{
	width: 90%;
    height:50%;
    padding:;
    color:red;
    margin-bottom:20px;
    margin-left:60px;
    text-align:center;
    font-size:30px;
    background-color:#4d79ff; 
    border-width:5px;  
    border-style:ridge;
}
.custname
{
    font-size:20px;
    text-align:center;
   color:#004d00;
}

body{
		background-color:pink;
	}

</style>

</head>

<body bgcolor="pink">



<%

try
{
    String query = "select * from Feedback";
    resultSet = statement.executeQuery(query);
    while(resultSet.next()){
                String query1 = "select * from Customer where cid = '"+resultSet.getString("cid")+"'";
                resultSet1 = statement.executeQuery(query1);
                while(resultSet1.next()){

%>

<div class="feedback">

"<%=resultSet.getString("feedback")%>"<br>
                    <div class="custname">-<%=resultSet1.getString("cname")%></div>

</div>

<%
}
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


</body>

