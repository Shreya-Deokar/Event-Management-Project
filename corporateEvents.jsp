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

<%session.getAttribute("mail");%>

<h2>Let's Choose Your Occasion From The Following....</h2>

<form action="occasion" method="post">

<select name="occasion" id="occasion">

		<option value="Conference">Conference</option>
		<option value="Competitions">Competitions</option>
		<option value="College Events">College Events</option>
		<option value="School Events">School Events</option>
		<option value="Company Events">Company Events</option>

</select>

	
	<br><br><br><br>

<input type="submit" value="Submit"><input type="reset" value="Cancel">	
	
</form>

</body>

</html>