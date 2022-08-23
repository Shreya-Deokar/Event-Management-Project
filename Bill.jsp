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
ResultSet resultSet3 = null;
ResultSet resultSet4 = null;
ResultSet resultSet5 = null;
ResultSet resultSet6 = null;
ResultSet resultSet7 = null;
ResultSet resultSet8 = null;
ResultSet resultSet9 = null;
ResultSet resultSet10 = null;
connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
statement=connection.createStatement();

int mtotal = 0;
int vtotal = 0;
int dtotal = 0;
int ptotal = 0;
int itotal1 = 0;
int itotal2 = 0;
int total = 0;
int total1 = 0;
int stotal = 0;
int stotal1 = 0;
%>

<!DOCTYPE HTML>

<html>

<head>

<title>Bill</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<style>
	input[type=submit],input[type=reset]
	{
		background-color:red;
	}
	body{
		background-color:pink;
	}

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

</style>

</head>

<body bgcolor="pink">
<%session.getAttribute("id");%>

<h2>Here are Details of Your Event.......</h2>

<table>
<tr>
<th>Content</th>
<th>Value</th>
<th>Price</th>
</tr>

<%
try
{
	String sql ="select * from Event where eid = '"+session.getAttribute("id")+"'";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){

%>
<br><br>
<tr>
<td>Occasion<br><br></td> <td><%=resultSet.getString("occasion")%>  <br><br></td>
</tr>
<tr>
<td>Time <br><br></td> <td> From <%=resultSet.getString("FromTime")%>  To <%=resultSet.getString("ToTime")%> <br><br></td>
<tr>
<td>Date <br><br></td>        <td>  <%=resultSet.getString("date")%> <br><br></td>
</tr>
<tr>
<td>Peple <br><br></td>    <td><%=resultSet.getString("approx_people")%> <br><br></td>
</tr>

<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>


<%

try
{
String sql ="select * from Event where eid = '"+session.getAttribute("id")+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
					String sql1 ="select * from Venue where vid = '"+resultSet.getString("venue_name")+"'";
					resultSet2 = statement.executeQuery(sql1);
					while(resultSet2.next()){

						vtotal = resultSet2.getInt("vrate");

%>
<tr>
<td>Venue Name <br><br></td>   <td> <%=resultSet2.getString("vname")%> <br><br></td>
         <td><%=vtotal%> <br><br></td>
</tr>

<%
}
}
} catch (Exception e) {
e.printStackTrace();
}
%>

<%
try
{
String sql ="select * from Event where eid = '"+session.getAttribute("id")+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
					String sql1 ="select * from Cust_Venue where eid = '"+session.getAttribute("id")+"'";
					resultSet2 = statement.executeQuery(sql1);
					while(resultSet2.next()){

%>
<tr>
<td>Customer Venue Name <br><br></td>   <td> <%=resultSet2.getString("cvaddr")%> <br><br></td>
</tr>

<%
}
}
} catch (Exception e) {
e.printStackTrace();
}
%>


<%
try
{String sql ="select * from Event where eid = '"+session.getAttribute("id")+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String sql2 ="select * from Decoration where did = '"+resultSet.getString("decoration_name")+"'";
	resultSet3 = statement.executeQuery(sql2);
	while(resultSet3.next()){
		dtotal = resultSet3.getInt("drate");

%>
<tr>
<td>Decoration  <br><br></td>  <td> <%=resultSet3.getString("dname")%><br><br></td>
<td>     <%=dtotal%>  <br><br></td>
</tr>

<%
}
}
} catch (Exception e) {
e.printStackTrace();
}
%>


<%
try
{
String sql ="select * from Event where eid = '"+session.getAttribute("id")+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String sql3 = "select * from Photographer where pid = '"+resultSet.getString("photographer_name")+"'";
	resultSet4 = statement.executeQuery(sql3);
	while(resultSet4.next()){

			ptotal = resultSet4.getInt("prate");
%>
<tr>
<td>
Photographer <br><br></td> <td><%=resultSet4.getString("pname")%><br><br></td>
<td> <%=ptotal%>   <br><br></td>
</tr>

<%
}
}
} catch (Exception e) {
e.printStackTrace();
}
%>


<%
try
{
String sql ="select * from Event where eid = '"+session.getAttribute("id")+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){

	String sql4 = "select * from MakeupArtist where mid = '"+resultSet.getString("makeupartist_name")+"'";
	resultSet5 = statement.executeQuery(sql4);
	while(resultSet5.next()){

			 mtotal = resultSet5.getInt("mrate")*resultSet.getInt("no_of_person");
%>

<tr>
<td>MakeupArtist <br><br></td> <td> <%=resultSet5.getString("mname")%><br><br></td>
<td> <%=mtotal%><br><br></td>
</tr>

<%
}
}
} catch (Exception e) {
e.printStackTrace();
}
%>


<%
try
{
String sql ="select * from Event where eid = '"+session.getAttribute("id")+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String sql5 = "select * from Item where Iid in (select Iid from Menu_Item where Meid in (select Meid from Menu where Eid='"+resultSet.getString("eid")+"'))";
	resultSet6 = statement.executeQuery(sql5);
	while(resultSet6.next()){

				itotal1 = resultSet6.getInt("iprice")*resultSet.getInt("approx_people");

				itotal2 = itotal2+itotal1;
%>

<tr>
<td>Food Item <br><br></td><td> <%=resultSet6.getString("Iname")%> <br><br></td>
<td><%=itotal1%><br><br></td>
</tr>

<%
}
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<%
try
{
String sql ="select * from Event where eid = '"+session.getAttribute("id")+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String sql4 = "select * from Seating_Arragement where said in(select said from seating_event where eid in(select eid from Event where eid = '"+resultSet.getString("eid")+"'))";
	resultSet5 = statement.executeQuery(sql4);
	while(resultSet5.next()){

			 stotal = resultSet5.getInt("sprice");
			 stotal1 = stotal1+stotal;
%>

<tr>
<td>Seating Arrangement <br><br></td> <td> <%=resultSet5.getString("arrangement")%><br><br></td>
<td> <%=stotal%><br><br></td>
</tr>

<%
}
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<%
total = vtotal+dtotal+ptotal+itotal2+mtotal+stotal1;
%>

<tr>

<td>
</td>
<td>
Total Price
</td>
<td>
<%=total%>
</td>
</tr>

<tr>
<td><a href="TotalPrice?totalPrice=<%session.setAttribute("total",total);%>"><button>Proceed</button></a><br><br></td>
</tr>
</form>

<br><br>
</table>
</body>

</html>