<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trainer Login</title>
<style>
body {
	margin: 0;
	padding: 0;
	background-image: url("../images/bg1.jpg");
	background-size: cover;
}

.container {
	max-width: 1000px;
	margin: 0 auto;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
}

header {
	text-align: center;
	margin-bottom: 20px;
}

h1 {
	font-size: 48px;
	color: #333;
}

h2 {
	font-size: 30px;
	color: #A2FF86;
	margin: 10px 0;
}

h3 {
	font-size: 30px;
	color: #F94C10;
	margin: 10px 0;
}

#login {
	max-width: 400px;
	margin: 0 auto;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
	padding: 20px;
	margin-top: 20px;
}

label {
	display: block;
	font-size: 25px;
}

input[type="text"], input[type="password"] {
	width: 100%;
	font-size: 20px;
	padding: 5px;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	opacity: 0.6;
}

button[type="submit"] {
	width: 50%;
	cursor: pointer;
	margin-left: 100px;
	padding: 8px 15px;
	border-radius: 5px;
	font-size: 20px;
	opacity: 0.8;
}

button[type="submit"] {
	background-color: #fff;
	color: #005B41;
}

button[type="submit"]:hover {
	background-color: #005B41;
	color: #fff;
}

#forgot-password {
	display: block;
	text-align: Center;
	color: black;
	font-size: 20px;
	margin-top: 10px;
	margin-bottom: 10px;
}

#forgot-password:hover {
	text-decoration: none;
	color: red;
}

#signup {
	display: block;
	width: 50%;
	text-decoration: none;
	color: black;
	text-align: center;
	font-size: 20px;
	border-radius: 5px;
	padding: 10px 20px;
	background-color: white;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 85px;
	opacity: 0.6;
	margin-top: 10px;
}

#signup:hover {
	background-color:#A2FF86;
	opacity: 1;
}

#back {
	display: block;
	background-color: #fff;
	text-decoration: none;
	border-radius: 5px;
	margin-top: 10px;
	width: 10%;
	margin-left: 430px;
	color: black;
	border: 5px;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 20px;
	text-align: center;
	opacity: 0.8;
}

#back:hover {
	background-color: black;
	color: #fff;
}

p.copyright {
	width: 95%;
	color: black;
	font-size: 20px;
	text-align: right;
	bottom: 0;
	position: absolute;
}
</style>
</head>
<body>
	<div class="container">
		<header>
			<h2>${pass}</h2>
			<h3>${fail}</h3>
			<h1>Welcome to Trainer Login Page</h1>
		</header>

		<div id="login">
			<form action="/trainer/login" method="post">
				<label for="email">Email:</label> <input type="text" id="email"
					name="email"> <label for="password">Password:</label> <input
					type="password" id="password" name="password">
				<button type="submit">Login</button>
				<a id="forgot-password" href="/trainer/forgot-password">Forgot Password?</a>
				<hr>
				 <a id="signup"
					href="/trainer/signup">Create New Account</a>
			</form>
		</div>
		<a id="back" href="/">Back</a>
	</div>

	<footer>
		<p class="copyright">©Saish</p>
	</footer>
	<script>
		setTimeout(function() {
			var h2 = document.querySelector('h2');
			var h3 = document.querySelector('h3');
			if (h2 && h3) {
				h2.style.display = 'none';
				h3.style.display = 'none';
			}
		}, 1000);
	</script>
</body>