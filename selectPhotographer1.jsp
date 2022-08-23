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

<title>Photographer</title>



<style>

body{
		background-color:pink;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  width: 300px;
  height:180px;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.price {
  color: grey;
  font-size: 22px;
}

.card button{
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #ff0000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}


.card button:hover {
  opacity: 0.7;
}

.tooltip {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: #6600ff;
  color: #fff;
  text-align: center;
  border-radius: 7px;
  padding: 5px 0;
  position: absolute;
  z-index: 1;
  bottom: 125%;
  left: 50%;
  margin-left: -60px;
  opacity: 0;
  transition: opacity 0.3s;
}

.tooltip .tooltiptext::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: #555 transparent transparent transparent;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
  opacity: 1;
}

span.D1
		{
			display: inline-block;
  			
  			padding: 5px;   
			margin-left:70px;
			margin-bottom:70px;
			margin-top:55px;

		}

.p1{
	color: #0000ff;
}
	input[type=submit],input[type=reset]
	{
		background-color:red;
	}
</style>

</head>

<body bgcolor="pink">

<h2>Select Photographer</h2>

<%

try
{
String sql1 = "Select * from event where eid = '"+session.getAttribute("id")+"'";
resultSet1 = statement.executeQuery(sql1);
while(resultSet1.next()){
	String sql ="select * from Photographer where PPREFF = '"+resultSet1.getString("occasion")+"'";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){

%>

<span class="D1">
<div class="card">

 
   <div class="tooltip">
  
  <a href="photographerDetails.jsp?pname=<%=resultSet.getString("Pname") %>&id=<%=resultSet.getString("pid")%>"><button class="button b1"><h1><%=resultSet.getString("Pname") %></h1></button></a>
  
  <span class="tooltiptext"> To know other details click here</span>
  </div>
  
  <a href="selectPhotographer1?pname=<%=resultSet.getString("Pname") %>&id=<%=resultSet.getString("pid")%>"><p><button class="button b2"> Select Photographer </button></p></a>
  
</div>
</span>

<%
}
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<br><br>


</body>

</html>