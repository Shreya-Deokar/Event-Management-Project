<!DOCTYPE HTML>

<html>

<head>

<title>Customer Registration</title>

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

<form action="customer_register" method="POST">

<tr>
	<td>Name<br><br></td> <td><input type="text" name="C_Name"> <br><br></td>
</tr>
<tr>
	<td>Mail Id<br><br></td> <td><input type="text" name="C_Mail"><br><br></td> <td>Mobile No.<br><br></td> <td><input type="tel" name="C_Mobile"> <br><br></td>
</tr>
<tr>
	<td>Address<br><br></td>  <td><textarea name="C_Addr" rows="4" cols="30"></textarea> <br><br></tr>
</tr>
<tr>
	<td>Password<br><br></td> <td><input type="password" placeholder="Enter Password" name="C_Psw" id="password" required> <br><br></td>
</tr>
<tr>
	<td>Confirm Password<br><br><br></td> <td><input type="password" placeholder="Enter Confirm Password" name="C_Cpsw" id="confirm_password" required> <br><br><br></td>
</tr>
<tr>
<td>For Security Purpose:</td>
</tr>
<tr>
	<td>Enter Your Favrite Book<br><br><br></td><td><input type="text" name="C_Book" required><br><br></td>
</tr>
<tr>
	<td>Enter Your Favrite Flower<br><br><br></td><td><input type="text" name="C_Flower" required><br><br></td>
</tr>
<tr>
	<td>Enter Your Favrite 4 digit Number<br><br><br><td></td><td><input type="text" name="C_Number" required><br><br></td>
</tr>
<tr>
	<td><input type="submit" value="SignUp"/> <input type="reset" value="cancel"/><br><br></td>
</tr>
	
</form>

</table>

<script src="confirmPassword.js"></script>

</body>

</html>