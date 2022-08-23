<!DOCTYPE html>
<html>
<head>
<title>Feedback</title>

<meta name="viewport" content="width=device-width,initial scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>
*{
	box-sizing:border-box;
}
body{
		background-color:pink;
}
input[type=text],select,textarea{
	width:100%;
	padding:12px;
	border:1px solid rgb(255,182,193);
	border-radius:4px;
	resize:vertical;
}
input[type=email],select,textarea{
	width:100%;
	padding:12px;
	border:1px solid rgb(255,182,193);
	border-radius:4px;
	resize:vertical;
}
label
{
	padding:12px 12px 12px 0;
	display:inline-block;
}
input[type=submit]{

	color:pink;
	padding:12px 20px;
	border:none;
	border-radius:4px;
	cursor:pointer;
	float:right;
}
input[type=submit]:hover{
	background-color:#FF6347;
}
.container{
	border-radis:5px;
	background-color:#FFB6C1;
	padding:20px;
}
.col-75{
	float:left;
	width:75%;
	margin-top:6px;
}
.col-85{
	float:left;
	width:89%;
	margin-top:6px;
}
.row:after{
	content:"";
	display:table;
	clear:both;
}
</style>
</head>
<body bgcolor="#FFB6C1">
<h2>Give Your Feedback Here....<h2>
<br><br>
<div class="container">
<form action="FeedBack" method="POST">
<div class="row">
<div class="col-25">
<label for="fname">First Name</label>
</div>
<div class="col-75">
<input type="text" id="fname" name="firstname" placeholder="Your name..">
</div>
</div>
<div class="row">
<div class="col-25">
<label for="email">Mail Id &nbsp &nbsp &nbsp</label>
</div>
<div class="col-75">
<input type="email" id="email" name="mailid" placeholder="Your mail id..">
</div>
</div>
<div class="row">
<div class="col-25">
<label for="feed_back"><Feed Back</label>
</div>
<div class="col-85">
<textarea id="subject" name="subject" placeholder="write something.." style="height:200px">
</textarea>
</div>
</div>
<div class="row">
<input type="submit" value="submit">
</div>
</form>
</div>
</body>
</html>
