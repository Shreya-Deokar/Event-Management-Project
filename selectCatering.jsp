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
String id = request.getParameter("id");
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
catering

<%session.getAttribute("id");%>
<%session.getAttribute("menuId");%>
<%session.getAttribute("itype");%>

<%

try
{

	String query2 = "select * from Menu where eid = '"+session.getAttribute("id")+"'";
	resultSet2 = statement.executeQuery(query2);

	String query3 = "select * from Item where iname='"+name+"' and iid = '"+id+"'";
	resultSet = statement.executeQuery(query3);

	while(resultSet2.next() && resultSet.next()){
		String query4 = "insert into Menu_Item(meid,iid) values ('"+resultSet2.getString("meid")+"','"+resultSet.getString("iid")+"')";
		statement.executeUpdate(query4);

%>


Meid <%=resultSet2.getInt("Meid")%>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


<br><br>	

<%response.sendRedirect("selectCater.jsp");%>

</body>

</html>