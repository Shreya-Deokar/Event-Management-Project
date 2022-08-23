<!DOCTYPE HTML>

<html>

<head>

<title>Social Events</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>

.button {
		border: none;
		color: white;
		padding: 15px 32px;
		text-align: center;
		display: inline-block;
		font-size: 16px;
		margin-top:50px;
		margin-left: 400px;
		cursor: pointer;
	}
	
	.button1 {background-color: #008CBA;}
	.button2 {background-color: #008CBA;}
	body{
		background-color:pink;
}

</style>

</head>

<body bgcolor="pink">

<%session.getAttribute("id");%>
${message }

<h2>Now Choose Services.....<h2>

<a href="selectVenue.jsp"> <button class="button button1"> I want All Services</button> </a>
<a href="chooseServices.jsp"> <button class="button button2"> Let Me Choose</button> </a>

</body>

</html>