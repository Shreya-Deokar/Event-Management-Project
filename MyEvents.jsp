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

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>
* {
  box-sizing: border-box;
}

body {
  background-color: grey;
  font-family: Helvetica, sans-serif;
}

/* The actual timeline (the vertical ruler) */
.timeline {
  position: relative;
  max-width: 1000px;
  margin: 0 auto;
}

/* The actual timeline (the vertical ruler) */


/* Container around content */
.container {
  padding: 10px 40px;
  position: relative;
  right:60%;
  background-color: inherit;
  width: 50%;
}

/* The circles on the timeline */
.container::after {
  content: '';
  position: absolute;
  width: 25px;
  height: 25px;
  right: -17px;
  background-color: white;
  border: 4px solid #FF9F55;
  top: 15px;
  border-radius: 50%;
  z-index: 1;
}

/* Place the container to the left */
.left {
  left: 0;
}

/* Place the container to the right */
.right {
  left: 50%;
}

/* Add arrows to the left container (pointing right) */
.left::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  right: 30px;
  border: medium solid white;
  border-width: 10px 0 10px 10px;
  border-color: transparent transparent transparent white;
}

/* Add arrows to the right container (pointing left) */
.right::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  left: 30px;
  border: medium solid white;
  border-width: 10px 10px 10px 0;
  border-color: transparent white transparent transparent;
}

/* Fix the circle for containers on the right side */
.right::after {
  left: -16px;
}

/* The actual content */
.content {
  padding: 20px 30px;
  background-color: white;
  position: relative;
  border-radius: 6px;
}

/* Media queries - Responsive timeline on screens less than 600px wide */
@media screen and (max-width: 600px) {
  /* Place the timelime to the left */
  .timeline::after {
  left: 31px;
  }
  
  /* Full-width containers */
  .container {
  width: 100%;
  padding-left: 70px;
  padding-right: 25px;
  }
  
  /* Make sure that all arrows are pointing leftwards */
  .container::before {
  left: 60px;
  border: medium solid white;
  border-width: 10px 10px 10px 0;
  border-color: transparent white transparent transparent;
  }

  /* Make sure all circles are at the same spot */
  .left::after, .right::after {
  left: 15px;
  }
  
  /* Make all right containers behave like the left ones */
  .right {
  left: 0%;
  }
}
h2{
	color:red;
}
h3{
	color:blue;
}
</style>
</head>
<body>

<%session.getAttribute("mail");%>

<%

try
{
String query = "select * from Customer_Event where cid in(select cid from Customer where cmail='"+session.getAttribute("mail")+"')";
resultSet2 = statement.executeQuery(query);
while(resultSet2.next()){
	String query1 = "select *  from Event where eid = '"+resultSet2.getInt("eid")+"'order by date";
	resultSet = statement.executeQuery(query1);
	while(resultSet.next())
	{
%>
<%session.getAttribute("mail");%>
<div class="timeline">
  <div class="container left">
    <div class="content">
      <h2><%=resultSet.getString("occasion")%></h2>
      <p><%=resultSet.getString("date")%></p>
	  <h3><%=resultSet.getString("Approval")%></h3>
	  <a href="Bill1.jsp?id=<%=resultSet.getString("eid")%>"><button type="button" class="btn btn-primary"> Show Bill </button></a><br><br>
	  <a href="eventDeleteServlet?id=<%=resultSet2.getString("eid")%>"><button type="button" class="btn btn-primary">Delete</button><a>
    </div>
  </div>
</div>

<%
}
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</body>

</html>
