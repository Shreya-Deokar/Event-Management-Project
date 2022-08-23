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
<%session.getAttribute("id");%>

<%

try
{
	String query1 = "select mid from MakeupArtist where mname = '"+name+"' and mid = '"+id+"'";
	resultSet = statement.executeQuery(query1);
	while(resultSet.next())
	{
		String query = "update Event set  makeupartist_name='"+resultSet.getInt("mid")+"' where eid='"+session.getAttribute("id")+"'";
		statement.executeUpdate(query);
	}

}

	catch (Exception ex)
    {
         request.setAttribute("message", "File upload failed due to "+request.getAttribute("id")+" : " + ex);
    }
    response.sendRedirect("selectMakeup5.jsp");
%>

</body>

</html>