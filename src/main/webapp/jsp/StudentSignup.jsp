<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Signup</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
}

h1 {
	text-align: center;
}

h3 {
	text-align: center;
}

form {
	text-align: center;
	background-color: #fff;
	border-radius: 5px;
	padding: 20px;
	width: 700px;
	margin: 0 auto;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}

label {
	display: block;
	text-align: left;
	margin: 5px 0;
}

input[type="text"], input[type="email"], input[type="number"], input[type="password"],
	input[type="file"] {
	width: 100%;
	padding: 5px;
	margin: 5px 0;
}

input[type="radio"] {
	margin: 0 5px;
}

#submit {
	background-color: #0074d9;
	color: #fff;
	padding: 5px 10px;
	border: none;
	cursor: pointer;
}

#submit:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<h1>Student signup page</h1>
	<h3>Enter details</h3>
	<h2 style="color: green">${pass}</h2>
	<h3 style="color: red">${fail}</h3>
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
				<td><a href=""><button id="submit">Create</button></a></td>
				<td><button type="reset">Cancel</button></td>
			</tr>
		</table>
		<a href="/" ><button>Back</button></a>
	</mvc:form>
	<br>
	
</body>
</html>
