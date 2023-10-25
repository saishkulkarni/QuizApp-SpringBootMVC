<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	background-image: url("../images/bg1.jpg");
	background-size: cover;
}

.container {
	max-width: 1000px;
	margin: 0 auto;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
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
	color: green;
	margin: 10px 0;
}

h3 {
	font-size: 30px;
	color: red;
	margin: 10px 0;
}

#login {
	max-width: 1000px;
	margin: 0 auto;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	padding: 20px;
	margin-top: 20px;
}

label {
	display: block;
	margin-top: 10px;
	font-size: 20px
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

button[type="submit"], button[type="reset"] {
	background-color: #007BFF;
	color: #fff;
	border: none;
	padding: 15px 30px;
	border-radius: 5px;
	margin-right: 10px;
	cursor: pointer;
	font-size: 20px;
}

button[type="reset"] {
	background-color: #ccc;
}

button[type="submit"]:hover, button[type="reset"]:hover {
	background-color: #0056b3;
}

a {
	text-decoration: none;
	display: block;
	text-align: center;
	margin-top: 10px;
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
			<a href="/"><button>Back</button></a>
		</div>
	</div>
</body>
</html>
