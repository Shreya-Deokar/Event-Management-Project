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

<title>Customer Bookings</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>

table 
{
  border-collapse: collapse;
  width: 100%;
}

th, td 
{
  text-align: left;
  padding: 8px;
}

tr:nth-child(even)
{
	background-color: #f2f2f2
}

th 
{
  background-color: #4CAF50;
  color: white;
}

body{
		background-color:pink;
	}

</style>

</head>

<body>

<table>

<tr>
<th>Event ID</th>
<th>Customer Name</th>
<th>Occasion</th>
<th>Date</th>
<th>People</th>
<th>Bills</th>
<th>Approval</th>
</tr>

<%

try
{
    String query = "select * from Customer";
    resultSet = statement.executeQuery(query);
    while(resultSet.next()){
                String query1 = "select * from Event where eid in(select eid from Customer_Event where cid = '"+resultSet.getString("cid")+"')";
                resultSet1 = statement.executeQuery(query1);
                while(resultSet1.next()){

%>
<tr>
<td><%=resultSet1.getString("eid")%></td>
<td><%=resultSet.getString("cname")%></td>
<td><%=resultSet1.getString("occasion")%></td>
<td><%=resultSet1.getString("date")%></td>
<td><%=resultSet1.getString("approx_people")%></td>
<td><a href="Bill1.jsp?id=<%=resultSet1.getString("eid")%>"><button type="button" class="btn btn-secondary">Show Bill</button></a></td>
<td><a href="Approval.jsp?id=<%=resultSet1.getString("eid")%>"><button type="button" class="btn btn-info"><%=resultSet1.getString("Approval")%></button></a>
</tr>

<%
}
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>

</body>

</html>