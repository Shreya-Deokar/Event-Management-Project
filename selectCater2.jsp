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

<title>Catering</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<style>
	input[type=submit],input[type=reset]
	{
		background-color:red;
	}
	body{
		background-color:pink;
}

</style>

</head>

<body bgcolor="pink">
<%session.getAttribute("id");%>
<%session.getAttribute("menuId");%>

<h2>Select Your Food Type....</h2>

<form action="selectCater3.jsp" method="POST">

Select Type <select name="itype" id="itype">
					<option>-----Select Type-----</option>


<%

try
{
	String sql ="select distinct itype from Item";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){

%>
					<option><%=resultSet.getString("itype")%></option>


<%

}

%>
</select>

<%
connection.close();
%>

<%

}
catch(Exception e)
{
e.printStackTrace();
}

%>
	
	<br><br><br>
	
	<input type="submit" value="Submit"> &nbsp &nbsp <input type="reset" value="Cancel">

	<br><br>
	After Choosing Your Food Item <blink><a href="chooseServices.jsp"> Click Here!! </a></blink>
	

</form>

</body>

</html>