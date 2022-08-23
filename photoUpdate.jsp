<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%

String name = request.getParameter("pname");
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
String sql =  "select * from Photographer where pname= '"+name+"' and pid = '"+id+"'";
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

</heda>

<body bgcolor="pink">

<form action="photoupdate_process.jsp" method="post">

<table>

<tr>

	<td>Photographer Name<br><br></td> <td><input type="Text" name="P_Name" value=<%=resultset.getString("pname")%>><br><br></td>
	
</tr>		
<tr>
<td>Preferred For<br><br></td> 
						<td><select name="P_preff" required>
	
						<option>Select Prefence</option>
	
						<option value="Marriage">Marriage</option>
						<option value="Engagement">Engagement</option>
						<option value="Birthday Party">Birthday Party</option>
						<option value="Anniversary Party">Anniversary Party</option>
						<option value="Get Toghether">Get Together</option>
						<option value="Corporate Event">Corporate Event</option>
						<option value="Comapany Event">Company Event</option>
						<option value="College Event">College Event</option>
		
				   </select><br><br></td>


</tr>
<tr>

	<td>Rate<br><br></td> <td><input type="number" name="P_Rate" value=<%=resultset.getString("prate")%>><br><br></td>
	
</tr>


<tr>
	
	<td>Mobile No.<br><br></td> <td><input type="tel" name="P_Mobile" value=<%=resultset.getString("pphone")%>><br><br></td>
	
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