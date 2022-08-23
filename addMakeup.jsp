<!DOCTYPE HTML>

<html>

<head>

<title>Add Makeup Artist</title>

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

<h1>Add Makeup Artist</h1><br><br>

<table>

<form action="AddMakeup" method="POST" enctype="multipart/form-data">

<tr>

	<td>Makeup Artist Name<br><br></td>  <td><input type="Text" name="M_Name"><br><br></td>
	
</tr>

<tr>	
	
	<td>Mobile No.<br><br></td>  <td><input type="tel" name="M_Mobile"><br><br></td>
	
</tr>	

<tr>
	
	<td>Rate(Per Person)<br><br></td> <td><input type="number" name="M_Rate"><br><br></td>
	
</tr>

<tr>	

	<td>Images<br><br></td> <td><input type="file" name="mphoto" multiple><br><br></td>
	
</tr>	
	
		<td><input type="submit" value="Submit">
		<input type="reset" value="Cancel"><br><br></td>

</form>

</table>

</body>

</html>