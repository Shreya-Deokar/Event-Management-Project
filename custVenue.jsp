<!DOCTYPE HTML>

<html>

<head>

<title>Customer Venue</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>
body{
		background-color:pink;
}	
</style>

</head>

<body bgcolor="pink">

<%session.getAttribute("id");%>

<table>

<form action="custVenue" method="POST">

<tr>

<td>Enter Your Name<br><br></td> <td><input type="text" name="custName"><br><br></td>

</tr>

<tr>

<td>Enter Your Full Address<br><br></td> <td><textarea name="custAddr" rows="4" cols="50"></textarea><br><br></td>

</tr>

<tr><td><input type="submit" value="Submit"><input type="reset" value="Cancel"></td></tr>

</form>

</table>

</body>

</html>