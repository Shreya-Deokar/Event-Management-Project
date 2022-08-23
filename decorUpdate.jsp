<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%

String name = request.getParameter("dname");
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
String sql =  "select * from Decoration where dname= '"+name+"' and did = '"+id+"'";
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

<form action="decorupdate_process.jsp" method="post">

<table>

<tr>
<td> Decoration Name <br><br> </td> <td> <input type="text" name="D_Name" value=<%=resultset.getString("dname")%> required><br><br> </td>
</tr>
<tr>
<td>	Decoration Type <br><br></td> <td><select name="D_type" id="D_Type" required>
						<option value="Type">Type</option>
						<option value="Balloon">Balloon</option>
						<option value="Flowers">Flowers</option>
						<option value="Car">Car</option>
						<option value="Office">Office</option>
						<option value="Room">Room</option>
						<option value="Birthday">Birthday</option>
						<option value="Anniversary">Anniversary</option>
						<option value="Wedding">Wedding</option>
						<option value="Party">Party</option>
					</select><br><br></td>
</tr>					
<tr>
<td> Rate <br><br></td> <td><input type="number" name="D_Rate" value=<%=resultset.getString("drate")%> required><br><br></td>
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