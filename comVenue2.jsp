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

<title>Venue</title>

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

<table>

<h2>Select Your Preferences...</h2>

<form action="comVenue3.jsp" method="post">

<tr>

<td>Select State <br><br></td> <td> <select name="Vstate" id="Vstate">
					<option>Maharastra</option>
			   </select><br><br></td>

</tr>
<br><br>

<tr>
<td>Select District <br><br></td> <td> <select name="vdistrict" id="vdistrict">
					<option>-----Select District-----</option>


<%

try
{
	String sql ="select distinct vdistrict from Venue";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){

%>
					<option><%=resultSet.getString("vdistrict")%></option>


<%

}

%>
</select><br><br></td>

</tr>
<br><br>

<tr>

<td>Select City <br><br></td> <td> <select name="vcity" id="vcity">
					<option>-----Select City-----</option>

<%

try
{
	String sql1 ="select distinct vcity from Venue";
	resultSet1 = statement.executeQuery(sql1);
	while(resultSet1.next()){

%>
					<option><%=resultSet1.getString("vcity")%></option>


<%

}

%>
</select><br><br></td>

</tr>
<br><br>

<tr>

<td>Select Area <br><br></td> <td> <select name="varea" id="varea">
					<option>-----Select Area -----</option>

<%

try
{
	String sql2 ="select distinct varea from Venue";
	resultSet2 = statement.executeQuery(sql2);
	while(resultSet2.next()){

%>
					<option><%=resultSet2.getString("varea")%></option>

<%

}

%>
</select><br><br></td>

</tr>
<br><br>


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

<%

}
catch(Exception e)
{
e.printStackTrace();
}

%>
<%

}
catch(Exception e)
{
e.printStackTrace();
}

%>	

<tr>
<td><input type="submit" value="Submit"><input type="reset" value="Cancel"><br><br></td>
</tr>

</table>

</form>

</body>

</html>