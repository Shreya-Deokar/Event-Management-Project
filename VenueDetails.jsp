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
String name = request.getParameter("vname");
String id = request.getParameter("id");
%>


<!DOCTYPE HTML>

<html>

<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>
body{
		background-color:pink;
}
</style>

</head>

<body bgcolor="pink">

<h2>Here is the details of Venue.....</h2>

<table>
<%

try
{
	connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
	statement=connection.createStatement();
	String sql ="select * from Venue where vname='"+name+"' and vid = '"+id+"'";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){

%>

<tr>
<td>Name of Venue <br><br></td> <td><%=resultSet.getString("vname")%> <br><br></td>
</tr>
<tr>
<td>Total  Capacity of Venue <br><br></td> <td><%=resultSet.getString("vcapacity")%> <br><br></td>
</tr>
<tr>
<td>Address of Venue <br><br></td> <td><%=resultSet.getString("vaddress")%> <br><br></td>
</tr>
<tr>
<td>Rate of Venue <br><br></td> <td><%=resultSet.getString("vrate")%> <br><br></td>
</tr>
<tr>
<td>Phone Number <br><br></td> <td><%=resultSet.getString("vphone")%> <br><br></td>
</tr>
<tr>
<td>Email <br><br></td> <td><%=resultSet.getString("vemail")%> <br><br></td>
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
	String sql ="select * from Venue_Image where Viid in(select Viid from Venue_Vimage where Vid in(select Vid from Venue where vid = '"+id+"'))";
	statement=connection.createStatement();
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){

%>

<td>
<img src="Images/<%=resultSet.getString("Vimage") %>"  height="200" width="200" /> <br><br></td>

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
