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
String name = request.getParameter("pname");
String id = request.getParameter("id");
%>


<!DOCTYPE HTML>

<html>

<head>

<title>Photographer</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<style>
body{
		background-color:pink;
}
</style>

</head>

<body bgcolor="pink">

<h2>Here is the details of Photographer.....</h2>
<%=name%>
<table>
<%

try
{
	connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
	statement=connection.createStatement();
	String sql ="select * from Photographer where pname='"+name+"' and pid='"+id+"'";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){

%>

<tr>
<td>Name of Photographer <br><br></td> <td><%=resultSet.getString("pname")%> <br><br></td>
</tr>
<tr>
<td>Mobile Number <br><br></td> <td><%=resultSet.getString("pphone")%> <br><br></td>
</tr>
<tr>
<td>Rate <br><br></td> <td><%=resultSet.getString("prate")%> <br><br></td>
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
	String sql ="select * from Photo_Image where Piid in(select Piid from Photo_Pimage where Pid in(select Pid from Photographer where pname='"+name+"' and pid='"+id+"'))";
	statement=connection.createStatement();
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){

%>

<td>
<img src="Images/<%=resultSet.getString("Pimage") %>"  height="100" width="150" /> <br><br></td>

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
