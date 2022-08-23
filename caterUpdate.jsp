<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%

String name = request.getParameter("cname");
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
String sql =  "select * from Item where iname= '"+name+"' and iid = '"+id+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	
%>

<!DOCTYPE HTML>
<html>

<head>

<title>Cater Update</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>
body{
		background-color:pink;
	}
</style>

</head>
<body bgcolor="pink">

<form action="caterupdate_process.jsp" method="post">

<table>

<td>Item Name <br><br></td> <td><input type="text" name="I_name" value=<%=resultset.getString("iname")%>><br><br></td>
	
</tr>

<tr>

	<td>Item Type<br><br></td>  <td><select name="I_type" id="I_type">
					<option value="Type">Type</option>
					<option value="Breakfast">Breakfast</option>
					<option value="Lunch">Lunch</option>
					<option value="Snacks">Snacks</option>
					<option value="Dinner">Dinner</option>
				</select><br><br></td>
				
</tr>

<tr>

	<td>Item Price<br><br></td>  <td><input type="number" name="I_price" min="0" max="1000" value=<%=resultset.getString("iprice")%>><br><br></td>
	
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