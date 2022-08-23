<!DOCTYPE html>

<html>

<head>

<title>Add Catering</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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

<h1>Add Catering</h1><br><br>

<table>

<form action="AddCater" method="POST" enctype="multipart/form-data">

<tr>

	<td>Item Name <br><br></td> <td><input type="text" name="I_name"><br><br></td>
	
</tr>

<tr>

	<td>Item Type<br><br></td>  <td><select name="I_type" id="I_type">
					<option value="Type">Type</option>
					<option value="Breakfast">Breakfast</option>
					<option value="Lunch">Lunch</option>
					<option value="Snacks">Snacks</option>
					<option value="Dinner">Dinner</option>
				</select><br><br></td>
				
</tr>

<tr>

	<td>Item Price<br><br></td>  <td><input type="number" name="I_price" min="0" max="1000"><br><br></td>
	
</tr>	

<tr>

	<td>Images<br><br></td><td><input type="file" name="iphoto" multiple><br><br></td>

</tr>	

<tr>
	<td><input type="submit" value="Submit">
	<input type="reset" value="Cancel"><br><br></td>
</tr>

</form>

</table>

</body>

</html>