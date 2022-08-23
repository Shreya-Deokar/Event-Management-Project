<!DOCTYPE HTML>

<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<style>

	.container{
		align:center;
		width:500px;
		margin-left:520px;
		margin-top:50px;
	}

	input[type=email], input[type=password] {
		width: 75%;
		padding: 15px;
		margin: 5px 0 22px 0;
		display: inline-block;
		border: none;
		background: #f1f1f1;
	}

	h1{
		text-align:center;
	}
	
	label{
		font-size:20px;
		font-family:Arial, Helvetica, sans-serif;
	}

	input[type=submit],input[type=reset]
	{
		background-color:red;
	}
	body{
		background-color:pink;
	}

</style>

<title>Admin Login</title>

</head>

<body bgcolor="pink">

<h1>Admin Login!!</h1>

<br><br><br>

<div class="container">

<br><br><br>

<form action="admin_login" method="POST">

	<img src="download (5).jpg" height="30" width="30">
	<label for="email"><b> &nbsp &nbsp Email</b></label>
	&nbsp &nbsp <input type="email" placeholder="Enter Email" name="email" id="email" required><br><br>
	<img src="download (6).jpg" height="30" width="30">
	<label for="psw"><b> &nbsp &nbsp Password</b></label>
	&nbsp &nbsp <input type="password" placeholder="Enter Password" name="psw" id="psw" required><br><br>
	&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
	<input type="submit" value="Submit"/> <input type="reset" value="Cancel"/>

</form>

<br><br><br>

</div>

</body>

</html>