<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
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
	margin-bottom: 10px; border : 1px solid #ccc;
	border-radius: 5px;
	opacity: 0.6;
	border: 1px solid #ccc;
}

button[type="submit"], button[type="reset"] {
	margin-left: 75px;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 20px;
	opacity: 0.8;
}

button[type="submit"] {
	background-color: #fff;
	color: #005B41;
}

button[type="reset"] {
	background-color: #fff;
	color: #C70039;
}

button[type="submit"]:hover {
	background-color: #005B41;
	color: #fff;
}

button[type="reset"]:hover {
	background-color: #C70039;
	color: #fff;
}

a {
	display: block;
	background-color: #fff;
	text-decoration: none;
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

a:hover {
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
			<h1>Welcome to Quiz Application</h1>
		</header>

		<div id="login">
			<form action="/admin/login" method="post">
				<label for="email">Email:</label> <input type="text" id="email"
					name="email"> <label for="password">Password:</label> <input
					type="password" id="password" name="password">
				<button type="submit">Login</button>
				<button type="reset">Cancel</button>
			</form>
		</div>
		<a href="/">Back</a>
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
</html>
