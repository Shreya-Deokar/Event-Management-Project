<!DOCTYPE HTML>

<html>

<head>

<title>Add Decoration</title>

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

<h1>Add Decoration</h1><br><br>

<form action="AddDecoration" method="POST" enctype="multipart/form-data">

<table>

<tr>
<td> Decoration Name <br><br> </td> <td> <input type="text" name="D_Name" required><br><br> </td>
</tr>
<tr>
<td>	Decoration Type <br><br></td> <td><select name="D_type" id="D_Type" required>
						<option value="Type">Type</option>
						<option value="Balloon">Balloon</option>
						<option value="Flowers">Flowers</option>
						<option value="Car">Car</option>
						<option value="Office">Office</option>
						<option value="Room">Room</option>
						<option value="Birthday">Birthday</option>
						<option value="Anniversary">Anniversary</option>
						<option value="Marriage">Marriage</option>
						<option value="Party">Party</option>
					</select><br><br></td>
</tr>					
<tr>
<td> Rate <br><br></td> <td><input type="number" name="D_Rate"><br><br></td>
</tr>
<tr>
<td>Images <br><br></td> <td><input type="file" name="D_photo" multiple required><br><br></td>
</tr>
<tr>
<td><input type="submit" value="Submit">
<input type="reset" value="Cancel"></td>
</tr>
</table>

</form>

</body>

</html>