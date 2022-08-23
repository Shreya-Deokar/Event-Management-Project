<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%

String name = request.getParameter("name");
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
String sql =  "select * from Venue where vname= '"+name+"' and vid = '"+id+"'";
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

<head>

<body bgcolor="pink">

<form action="venueupdate_process.jsp" method="post">

<table>

	<tr>
		<td>Venu Name<br><br></td>
		<td><input type="text" name="V_name" value=<%=resultSet.getString("vname")%> required><br><br></td> 
		<td>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  Approx. Capacity &nbsp &nbsp <br><br></td>  
		<td><input type="number" name="V_capacity" value=<%=resultSet.getString("vcapacity")%> required><br><br></td>
	</tr>
	<tr>
		<td>Address<br><br></td>
		<td><textarea id="addr" name="V_addr" rows="4" cols="30" value=<%=resultSet.getString("vaddress")%> required></textarea><br><br></td> 
		<td>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp State<br><br></td>
		<td><input type="text" name="V_state" value=<%=resultSet.getString("vstate")%> required><br><br></td>
		<td>&nbsp &nbsp District<br><br></td>
		<td><input type="text" name="V_dist" value=<%=resultSet.getString("vdistrict")%> required><br><br></td>
		<td>&nbsp &nbsp City &nbsp &nbsp <br><br></td> 
		<td><input type="text" name="V_city" value=<%=resultSet.getString("vcity")%> required><br><br></td> 
		<td>&nbsp &nbsp Area &nbsp &nbsp <br><br></td>  
		<td><input type="text" name="V_area" value=<%=resultSet.getString("varea")%> required><br><br></td>
	</tr>

	<tr>
	<td> Rate<br><br></td> 
	<td><input type="number" name="V_rate" value=<%=resultSet.getString("vrate")%> required><br><br></td>
	<td>&nbsp &nbsp Phone no.<br><br></td> 
	<td><input type="tel" name="V_phone" value=<%=resultSet.getString("vphone")%> required><br><br></td>
	
	</tr>
	<tr>
	<td>Email<br><br></td>
	<td><input type="email" name="V_email" value=<%=resultSet.getString("vemail")%> required><br><br></td>
	</tr>

	<tr>
	<td><input type="submit" value="Submit">
	<input type="reset" value="Cancel"><br><br></td>
	</tr>

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