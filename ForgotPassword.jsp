<!DOCTYPE HTML>

<html>

<head>

<title>Forgot Password</title>

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

<h2>Enter Details....</h2>

<br><br><br>

<table>

<form action="ForgotPassword1.jsp" method="POST">

<tr>
	<td>Mail Id<br><br></td> <td><input type="text" name="C_Mail"><br><br></td>
</tr>

<tr>
	<td>Enter Your Favrite Book<br><br><br></td><td><input type="text" name="C_Book" required><br><br></td>
</tr>
<tr>
	<td>Enter Your Favrite Flower<br><br><br></td><td><input type="text" name="C_Flower" required><br><br></td>
</tr>
<tr>
	<td>Enter Your Favrite 4 digit Number<br><br><br></td><td><input type="text" name="C_Number" required><br><br></td>
</tr>
<tr>
	<td><input type="submit" value="Submit"/> <input type="reset" value="cancel"/><br><br></td>
</tr>
	
</form>

</table>

</body>

</html>