<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title> Contact US</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style.css">
<style>
body{
		background-color:pink;
	}
</style>

</head>
<body>
<section class="contact">
<div class="content">
<h2>Contact Us</h2>
<p>Event Management welcomes you....... we are always with you to solve your problems lets connect with us......... </p>
</div>
<div class="container">
<div class="contactInfo">
<div class="box">
<div class="text">
<h3>Address</h3>
<p>SS Event Management<br>Diamond Hill Apartment<br>JM Road<br>Pune 411005</p>
</div>
</div>
<div class="box">
<div class="text">
<h3>Phone</h3>
<p>020-2589663</p>
</div>
</div>
<div class="box">
<div class="text">
<h3>Email</h3>
<p>SSEventmanagement2@gmail.com</p>
</div>
</div>
</div>
<div class="contactForm">
<form action="ContactForm" method="POST">
<h2>Send Message</h2>
<div class="inputBox">
<input type="text" name="name" required="required">
<span>Full Name</span>
</div>
<div class="inputBox">
<input type="text" name="email" required="required">
<span>Email</span>
</div>
<div class="inputBox">
<textarea name="message" required="required"></textarea>
<span>Type your Message....</span>
</div>
<div class="inputBox">
<input type="submit" value="Send">
</div>
</form>
</div>
</div>
</section>
</body>
</html>