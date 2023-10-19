<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Login</title>
<link rel="stylesheet" href="../css/index.css">
<style>
body, h1, h2, h3, p {
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
}

h1 {
	font-size: 28px;
	color: #333;
	margin: 20px 0;
}

h2 {
	color: green;
	font-size: 20px;
}

h3 {
	color: red;
	font-size: 20px;
}

#login {
	background-color: #fff;
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

form {
	margin: 10px 0;
}

label {
	font-weight: bold;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px;
	margin: 5px 0;
	border: 1px solid #ccc;
	border-radius: 3px;
}

button[type="submit"] {
	background-color: #007BFF;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

button[type="reset"] {
	background-color: #ccc;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

button[type="submit"]:hover, button[type="reset"]:hover {
	background-color: #0056b3;
}

a {
	text-decoration: none;
	color: #007BFF;
}
</style>
</head>
<body>
	<h1>Welcome to Student Login Page</h1>
	<h2>${pass}</h2>
	<h3>${fail}</h3>
	<div id="login">
		<form action="#" method="post">
			<table>
				<tr>
					<td><label for="email">Email:</label></td>
					<td><input type="text" id="email" name="email"></td>
				</tr>
				<tr>
					<td><label for="password">Password:</label></td>
					<td><input type="password" id="password" name="password"></td>
				</tr>
				<tr>
					<td><button type="submit">Login</button></td>
					<td><button type="reset">Cancel</button></td>
				</tr>
			</table>
		</form>
		<a href="#">Forgot Password?</a><br> <br> <a href="/student/signup"><button>Create
				New Account</button></a> <a href="/"><button>Back</button></a>
	</div>

	<script>
		setTimeout(function() {
			document.getElementById('pass').style.display = 'none';
			document.getElementById('fail').style.display = 'none';
		}, 1000);
	</script>
</body>
</html>
