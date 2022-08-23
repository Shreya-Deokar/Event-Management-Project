<!DOCTYPE HTML>

<html>

<head>

<title>Social Events</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<style>
	input[type=submit],input[type=reset]
	{
		background-color:red;
	}
	body{
		background-color:pink;
	}

</style>

</head>

<body bgcolor="pink">
service.jsp
<%=session.getAttribute("id")%>

${message }
<table>
<form action="chooseSeating1.jsp" method="POST">

<tr>

<td>Sofa<br><br></td> <td><input type="checkbox" name="seating" value="Sofa"><br><br></td>
</tr>
<tr>
<td>Chair<br><br></td> <td><input type="checkbox" name="seating" value="Chair"><br><br></td>
</tr>
<tr>
<td>Table and Chair<br><br></td> <td><input type="checkbox" name="seating" value="Table and Chair"><br><br></td>
</tr>

<tr>

<td><input type="submit" value="Submit"><input type="reset" value="Cancel"></td>

</tr>

</form>

</table>

</body>

</html>