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

<title>Customer</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<style>

	.topnav {
  			overflow: hidden;
  			bottom: 0;
  			width:100%;
  			background-color: #333;
			margin-top:50;
			margin-bottom:20;
		}

		.topnav a {
 		 	float: left;
  			color: #f2f2f2;
  			text-align: center;
  			padding: 14px 16px;
  			text-decoration: none;
  			font-size: 17px;
		}

		.topnav a:hover {
  			background-color: #ddd;
  			color: black;
		}

		.topnav a.active {
 			 background-color: #4CAF50;
 			 color: white;
		}
		
		span.S1
		{
			display: inline-block;
  			width: 200px;
  			height: 250px;
  			padding: 5px;
  			border: 3px solid green; 
			background-color:#cc33ff;  
			margin-left:70px;
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

</head>

<body bgcolor="pink">

<%

try{
	String sql ="select * from Customer where cmail = '"+session.getAttribute("mail")+"'";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){

%>

<h1>Welcome <%=resultSet.getString("cname") %>!!!</h1>

${message}

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


<br><br>

<div class="topnav">

	<a class="active" href="Main">Home</a>
	<a href="BookEvent.jsp">Book An Event</a>
	<a href="MyEvents.jsp">My Events</a>
	<a href="GiveFeedback.jsp">Give Feedback</a>

	<div class="profile">
			<div class="dropdown">
					<button onclick="myFunction()" class="dropbtn">Login</button>
						<div id="myDropdown" class="dropdown-content">						
							<a href="#about">Profile</a>
							<a href="logout.jsp">Logout</a>
						</div>
			</div>	
	</div>

</div>



<br><br><br>


<h1><font color="#80002a">Services To Be Provided:</font></h1><br><br>


	<div>

		<span class="S1"><h2>Venue</h2><img src="venue.jpg" class="rounded" height="160" width="185" align="right"></span>
		<span class="S1"><h2>Food</h2><img src="download (1).jpg" class="rounded" height="160" width="185" align="right"></span>
		<span class="S1"><h2>Decoration</h2><img src="decoration.jpg" class="rounded" height="160" width="185" align="right"></span>
		<span class="S1"><h2>Makeup</h2><img src="download (2).jpg" class="rounded" height="150" width="185" align="right"></span>
		<span class="S1"><h2>Photography</h2><img src="download (3).jpg" class="rounded" height="160" width="185" align="right"></span>

	</div>

	<script>
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}
</script>

</body>

</html>