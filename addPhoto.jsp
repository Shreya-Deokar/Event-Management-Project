<!DOCTYPE HTML>

<html>

<head>

<title>Add Photographer</title>

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

<h1>Add Photographer</h1><br><br>

<table>

<form action="AddPhoto" method="POST" enctype="multipart/form-data">

<tr>

	<td>Photographer Name<br><br></td> <td><input type="Text" name="P_Name"><br><br></td>
	
</tr>		
<tr>
<td>Preferred For<br><br></td> 
						<td><select name="P_preff" required>
	
						<option>Select Prefence</option>
	
						<option value="Marriage">Marriage</option>
						<option value="Engagement">Engagement</option>
						<option value="Birthday Party">Birthday Party</option>
						<option value="Anniversary Party">Anniversary Party</option>
						<option value="Get Toghether">Get Together</option>
						<option value="Corporate Event">Corporate Event</option>
						<option value="Comapany Event">Company Event</option>
						<option value="College Event">College Event</option>
		
				   </select><br><br></td>


</tr>
<tr>

	<td>Rate<br><br></td> <td><input type="number" name="P_Rate"><br><br></td>
	
</tr>


<tr>
	
	<td>Mobile No.<br><br></td> <td><input type="tel" name="P_Mobile"><br><br></td>
	
</tr>



<tr>

	<td>Images<br><br></td> <td><input type="file" name="pphoto" multiple><br><br></td>
	
</tr>	
	
<tr>	
		<td><input type="submit" value="Submit">
		<input type="reset" value="Cancel"><br><br></td>
</tr>

</form>

</table>

</body>

</html>