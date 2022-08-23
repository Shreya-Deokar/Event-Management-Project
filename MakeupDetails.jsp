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
String name = request.getParameter("mname");
String id = request.getParameter("id");

%>


<!DOCTYPE HTML>

<html>

<head>

<title>Makeup</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<style>
body{
		background-color:pink;
}
</style>

</head>

<body bgcolor="pink">

<h2>Here is the details of Makeup Artist.....</h2>

<table>
<%

try
{
	connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
	statement=connection.createStatement();
	String sql ="select * from MakeupArtist where mname='"+name+"' and mid = '"+id+"'";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){

%>

<tr>
<td>Name Makeup Artist <br><br></td> <td><%=resultSet.getString("mname")%> <br><br></td>
</tr>
<tr>
<td>Mobile Number <br><br></td> <td><%=resultSet.getString("mphone")%> <br><br></td>
</tr>
<tr>
<td>Rate per Person <br><br></td> <td><%=resultSet.getString("mrate")%> <br><br></td>
</tr>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<tr>

<td>
Images <br><br></td>

<%

try
{
	
	connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
	String sql ="select * from Makeup_Image where Miid in(select Miid from Makeup_Mimage where Mid in(select Mid from MakeupArtist where mname='"+name+"' and mid = '"+id+"'))";
	statement=connection.createStatement();
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){

%>

<td>
<img src="Images/<%=resultSet.getString("Mimage") %>"  height="100" width="150" /> <br><br></td>

</tr>


<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>

</body>

</html>
