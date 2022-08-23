<!DOCTYPE HTML>

<html>

<head>
<title>Makeup</title>

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

<form action="selectMakeup2" method="post">

Number of Person for Makeup:<input type="number" name="no_per" id="no_per">

<input type="submit" value="Submit"><input type="reset" value="Cancel">

</form>

</body>

</html>