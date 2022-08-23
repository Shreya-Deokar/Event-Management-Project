<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>

<head>

<title>Add Venue</title>

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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>

<body bgcolor="pink">

<h1>Add Venue</h1><br><br>

<form action="AddSeat" method="POST">

<table>

	<tr>
		<td>Arrangement<br><br></td>
		<td><input type="text" name="S_name" required><br><br></td> 
	</tr>
	<tr>
		<td>Price<br><br></td>
		<td><input type="number" name="S_price" required><br><br></td> 
	</tr>
	
	<tr>
	<td><input type="submit" value="Submit"/></td>
	<td><input type="reset" value="Cancel"/></td>
	</tr>

</table>

</form>

</body>

</html>