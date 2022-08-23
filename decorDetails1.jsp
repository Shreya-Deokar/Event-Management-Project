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
String name = request.getParameter("dname");
String id = request.getParameter("id");

%>


<!DOCTYPE HTML>

<html>

<title>Decoration</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>
body{
		background-color:pink;
}
</style>

<body bgcolor="pink">

<h2>Here is the details of Decoration.....</h2>

<table>
<%

try
{
	connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
	statement=connection.createStatement();
	String sql ="select * from Decoration where dname='"+name+"' and did = '"+id+"'";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){

%>

<tr>
<td>Name of Decoration <br><br></td> <td><%=resultSet.getString("dname")%> <br><br></td>
</tr>
<tr>
<td>Rate of Decoration <br><br></td> <td><%=resultSet.getString("drate")%> <br><br></td>
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
	String sql ="select * from Decoration_Image where Diid in(select Diid from Decoration_Dimage where Did in(select Did from Decoration where dname='"+name+"' and did = '"+id+"'))";
	statement=connection.createStatement();
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){

%>

<td>
<img src="Images/<%=resultSet.getString("Dimage") %>"  height="100" width="150" /> <br><br></td>

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
