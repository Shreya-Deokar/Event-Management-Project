<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%

String name = request.getParameter("mname");
String id = request.getParameter("id");

try
{
	Class.forName("org.postgresql.Driver");
}
catch(ClassNotFoundException e)
{
	e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
ResultSet resultSet1 = null;

%>

<%

try
{
connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
statement=connection.createStatement();
String sql =  "select * from MakeupArtist where mname= '"+name+"' and mid = '"+id+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	
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

<form action="makeupupdate_process.jsp" method="post">

<table>

<tr>

	<td>Makeup Artist Name<br><br></td>  <td><input type="Text" name="M_Name" value=<%=resultset.getString("mname")%><br><br></td>
</tr>

<tr>	
	
	<td>Mobile No.<br><br></td>  <td><input type="tel" name="M_Mobile" value=<%=resultset.getString("mphone")%>><br><br></td>
	
</tr>	

<tr>
	
	<td>Rate(Per Person)<br><br></td> <td><input type="number" name="M_Rate" value=<%=resultset.getString("mrate")%>><br><br></td>
	
</tr>

<tr>
<td><input type="submit" value="Submit">
<input type="reset" value="Cancel"><br><br></td>
</tr>

</table>
</form>

<%
}
connection.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

</body>
</html>