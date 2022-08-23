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
%>

<!DOCTYPE HTML>

<html>

<head>

<title>Venue</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
body{
		background-color:pink;
}
</style>

</head>

<body bgcolor="pink">

<h3>${message }</h3>

<div class="container">

<table class="table table-hover">

<tr>
<td><h3>Venue</h3></td>
<td><h3>Preferable For<h3></td>
<td><h3>Area<h3></td>
<td><h3>Update</h3></td>
<td><h3>Delete</h3></td>

</tr>
<%
try
{
	connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
	statement=connection.createStatement();
	String sql ="select * from Venue";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
		
%>
<tr>
<td><%=resultSet.getString("VNAME") %></td>
<td><%=resultSet.getString("Vpreferable_for") %></td>
<td><%=resultSet.getString("Varea") %></td>

<td><a href="venueUpdate.jsp?name=<%=resultSet.getString("VNAME") %>&id=<%=resultSet.getString("vid")%>"><button type="button" class="btn btn-primary">Edit</button></a></td>
<td><a href="venueDeleteServlet?vname=<%=resultSet.getString("VNAME") %>&id=<%=resultSet.getString("vid")%>"><button type="button" class="btn btn-primary">Delete</button></a></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>

</div>

<br><br><br>
&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  <a href="addVenue.jsp"> <button type="button" class="btn btn-danger">Add New</button></a>

</body>

</html>