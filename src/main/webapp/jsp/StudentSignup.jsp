<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Signup</title>
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
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
}

h1 {
	text-align: center;
	font-size: 48px;
	color: #333;
}

h2, h3 {
	font-size: 30px;
	margin: 10px 0;
}

h2 {
	color: #A2FF86;
}

h3 {
	color: #F94C10;
}

.centered-form {
	max-width: 1000px;
	margin: 0 auto;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
	padding: 20px;
	margin-top: 20px;
}

form {
	width: 100%;
}

label {
	display: block;
	font-size: 25px;
}

input {
	width: 100%;
	font-size: 20px;
	padding: 5px;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	opacity: 0.6;
}

password {
	width: 100%;
	font-size: 20px;
	padding: 5px;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	opacity: 0.6;
}

radiobutton {
	opacity: 0.6;
}

input[type="file"] {
	opacity: 0.6;
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

button {
	margin-left: 75px;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 20px;
	opacity: 0.8;
}

button#submit {
	background-color: #fff;
	color: #005B41;
}

button[type="reset"] {
	background-color: #fff;
	color: #C70039;
}

button#submit:hover {
	background-color: #005B41;
	color: #fff;
}

button[type="reset"]:hover {
	background-color: #C70039;
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
			<h1>Student Signup</h1>
		</header>
		<div class="centered-form">
			<mvc:form action="/student/signup" method="post"
				modelAttribute="student" enctype="multipart/form-data">
				<table>
					<tr>
						<td><label for="name">Name:</label></td>
						<td><mvc:input path="name" /></td>
						<td><mvc:errors path="name" /></td>
					</tr>
					<tr>
						<td><label for="email">Email:</label></td>
						<td><mvc:input path="email" /></td>
						<td><mvc:errors path="email" /></td>
					</tr>
					<tr>
						<td><label for="mobile">Mobile:</label></td>
						<td><mvc:input path="mobile" /></td>
						<td><mvc:errors path="mobile" /></td>
					</tr>
					<tr>
						<td><label for="password">Password:</label></td>
						<td><mvc:password path="password" /></td>
						<td><mvc:errors path="password" /></td>
					</tr>
					<tr>
						<td><label for="gender">Gender:</label></td>
						<td><mvc:radiobutton path="gender" value="male" />Male <mvc:radiobutton
								path="gender" value="female" />Female</td>
						<td><mvc:errors path="gender" /></td>
					</tr>
					<tr>
						<td><label for="picture">Picture:</label></td>
						<td><input id="picture" type="file" name="pic"></td>
					</tr>
					<tr>
						<td><button id="submit">Create</button></td>
						<td><button type="reset">Cancel</button></td>
					</tr>
				</table>
			</mvc:form>
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
