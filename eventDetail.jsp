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

<%session.getAttribute("id");%>

${message }

<form action="eventDetail" method="POST">

<h3>Let's Choose Your Occasion From The Following....</h3>

<select name="occasion" id="occasion">

		<option value="Marriage">Marriage</option>
		<option value="Engagement">Engagement</option>
		<option value="Anniversary">Anniversary</option>
		<option value="Birthday Party">Birthday Party</option>
		<option value="Get Together">Get Together</option>
		<option value="Family Function">Family Function</option>

</select>

<br><br><br>

<h3>Let's Give Some Details....</h3>

<table>

<tr>

<td>Time<br><br></td> <td>From  <input type="time" name="E_Time1"><br><br></td> <td>To<br><br></td> <td> <input type="time" name="E_Time2"> <br><br></td>

</tr>

<tr>

	<td>Date<br><br></td>  <td><input type="date" name="E_Date"> <br><br></td>

</tr>

<tr>

	<td>Approximate People <br><br></td> <td><input type="number" name="E_People"> <br><br></td>

</tr>

<tr>

<td><input type="submit" value="Submit"><input type="reset" value="Cancel"></td>

</tr>

</form>

</table>

</body>

</html>