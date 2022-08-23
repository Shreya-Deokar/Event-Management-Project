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

String seating_arrange = "";
String seating [] = request.getParameterValues("seating");
for(int i=0;i<seating.length;i++)
{
	seating_arrange = seating_arrange+seating[i]+" ";
}

%>

<!DOCTYPE HTML>

<html>

<head>

<title>Select Seating</title>

<style>

</style>

</head>

<body bgcolor="pink">
catering
<%=session.getAttribute("id")%>

<%%>

<%

try
{
	String query = "select * from Seating_Arragement where arrangement = '"+seating_arrange+"'";
	resultSet1 = statement.executeQuery(query);
	while(resultSet1.next())
	{
		String query1 = "insert into seating_event(eid,said) values ('"+session.getAttribute("id")+"','"+resultSet1.getString("said")+"')";
		statement.executeUpdate(query1);

%>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<br><br>	

<%
response.sendRedirect("service.jsp");
%>

</body>

</html>