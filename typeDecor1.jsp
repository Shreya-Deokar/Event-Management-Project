<!DOCTYPE HTML>

<html>

<head>

<title>Decoration</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>

	span.D1
		{
			display: inline-block;
  			width: 200px;
  			height: 250px;
  			padding: 5px;
  			border: 3px solid green; 
			background-color:#66ff33;  
			margin-left:80px;
		}
		
	span.D2
		{
			display: inline-block;
  			width: 200px;
  			height: 250px;
  			padding: 5px;
  			border: 3px solid green; 
			background-color:#66ff33;  
			margin-left:160px;
			margin-top:30px;
		}
		body{
		background-color:pink;
}

</style>

</head>

<body bgcolor="pink">
catering
<%session.getAttribute("id");%>
	<div class="decoration">
		
		<a href="selectBallon1.jsp"><span class="D1"><h2>Balloon</h2><img src="ballon.jpg" height="160" width="200" align="right"></span></a>
		<a href="selectCar1.jsp"><span class="D1"><h2>Car</h2><img src="car.jpg" height="160" width="200" align="right"></span></a>
		<a href="selectRoom1.jsp"><span class="D1"><h2>Room</h2><img src="room.jpg" height="160" width="200" align="right"></span></a>
		
	</div>

	<div class="decoration">
		
		<a href="selectFlower1.jsp"><span class="D2"><h2>Flower</h2><img src="flower.jpg" height="160" width="200" align="right"></span></a>
		<a href="selectOffice1.jsp"><span class="D2"><h2>Office</h2><img src="offiice.jpg" height="160" width="200" align="right"></span></a>
		
	</div>
	
	<br><br><br>
	
</form>

</body>

</html>