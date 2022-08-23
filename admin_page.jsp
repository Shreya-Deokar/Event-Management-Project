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

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

response.setHeader("Pragma", "no-cache"); 

response.setDateHeader("Expires", 0); 

if(session.getAttribute("mail")==null)
	response.sendRedirect("index.jsp");


%>

<!DOCTYPE HTML>

<html>

<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<title>Admin</title>

<style>

    * {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Float four columns side by side */
.column {
  float: left;
  width: 25%;
  padding: 0 5px;
}

.row {margin: 0 -5px;}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive columns */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 10px;
  }
}

/* Style the counter cards */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  padding: 16px;
  text-align: center;
  background-color: #444;
  color: white;
}

	input[type=submit],input[type=reset]
	{
		background-color:red;
	}

.profile
		{
			position: absolute;
			top: 101px;
			right: 50px;
			font-size: 20px;
		}

		.dropbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
  background-color: #3e8e41;
}

#myInput {
  box-sizing: border-box;
  background-image: url('searchicon.png');
  background-position: 14px 12px;
  background-repeat: no-repeat;
  font-size: 16px;
  padding: 14px 20px 12px 45px;
  border: none;
  border-bottom: 1px solid #ddd;
}

#myInput:focus {outline: 3px solid #ddd;}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f6f6f6;
  min-width: 230px;
  overflow: auto;
  border: 1px solid #ddd;
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}

body{
		background-color:pink;
	}
    h1{
        color:#0000cc;
    }

</style>

<link rel="stylesheet"  href="admin_page.css">

</head>

<body bgcolor="pink">


<%

try{
	String sql ="select * from Admin where admin_mail = '"+session.getAttribute("mail")+"'";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){

%>

<h1>Welcome Admin <%=resultSet.getString("admin_name") %>!!!</h1>

${message}

<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>

<br><br>

<div class="topnav">

    		<a class="active" href="Main">Home</a>
    		<a href="venue.jsp">Venue</a>
    		<a href="decoration.jsp">Decoration</a>
			<a href="catering.jsp">Catering</a>
			<a href="photographer.jsp">Photographer</a>
			<a href="Makeup_Artist.jsp">Makeup Artist</a>
			<a href="CustBookings.jsp">View Bookings</a>
			<a href="ViewBookings.jsp">View Feedbacks</a>

            <div class="profile">
			<div class="dropdown">
					<button onclick="myFunction()" class="dropbtn">Login</button>
						<div id="myDropdown" class="dropdown-content">						
							<a href="#about">Profile</a>
							<a href="index.jsp">Logout</a>
						</div>
			</div>	
	</div>

</div>

<br><br><br><br><br>

<%

try
{
    String query1 = "select count(*) from Customer";
    resultSet = statement.executeQuery(query1);
    String countrow = "";
    while(resultSet.next()){
                countrow = resultSet.getString(1);

%>

<div class="row">
  <div class="column">
    <div class="card">
      <h3><%=countrow%></h3>
      <p>Total Registration</p>
    </div>
  </div>

<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>

<%

try
{
    String query = "select count(*) from Event";
    resultSet1 = statement.executeQuery(query);
    String countrow1 = "";
    while(resultSet1.next()){
                   countrow1 = resultSet1.getString(1);
%>

  <div class="column">
    <div class="card">
      <h3><%=countrow1%></h3>
      <p>Total Events</p>
    </div>
  </div>


<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>

<%
try
{
    String query2 = "select count(date) from Event";
    resultSet2 = statement.executeQuery(query2);
    String countrow2 = "";
    while(resultSet2.next()){
                   countrow2 = resultSet2.getString(1);
%>

   <div class="column">
    <div class="card">
      <h3><%=countrow2%></h3>
      <p>Incoming Events</p>
    </div>
  </div>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<script>
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}
</script>

</body>

</html>