<!DOCTYPE HTML>

<html>

<head>

<title>Services</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<style>

	span.S1
		{
			display: inline-block;
  			width: 200px;
  			height: 250px;
  			padding: 5px;
  			border: 3px solid green; 
			background-color:#cc33ff;  
			margin-left:70px;
		}

	.A{
		line-height:2000%;
		text-align:center;
		font-size:20px;
		font-weight:bold;
	}

	blink{
		text-shadow:2px 2px 5px red;
	}
	body{
		background-color:pink;
	}

</style>

</head>

<body bgcolor="pink">

<%session.getAttribute("id");%>

<h2>Choose Your Services You Want..</h2>
<br><br><br>

<form action="" method="post">

	<div>

		<a href="selectVenue1.jsp"><span class="S1"><h2>Venue</h2><img src="venue.jpg" height="160" width="185" align="right"></span></a>
		<a href="selectCater4.jsp"><span class="S1"><h2>Food</h2><img src="download (1).jpg" height="160" width="185" align="right"></span></a>
		<a href="selectDecoration1.jsp"><span class="S1"><h2>Decoration</h2><img src="decoration.jpg" height="160" width="185" align="right"></span></a>
		<a href="selectPhotographer1.jsp"><span class="S1"><h2>Photography</h2><img src="download (3).jpg" height="160" width="185" align="right"></span></a>
		<a href="selectMakeup1.jsp"><span class="S1"><h2>Makeup</h2><img src="download (2).jpg" height="160" width="185" align="right"></span></a>

	</div>

	<div class="A">
	After Choosing Your Services <blink> <a href="Bill.jsp">Click Here!!</a> </blink> 
	</div>
	
</form>

</body>

</html>