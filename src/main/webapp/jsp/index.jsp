<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	text-align: center;
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	margin: 10px;
}

button {
	background-color: #0074d9;
	color: #fff;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<a href="/student/login"><button>Student</button></a>
	<a href="/trainer"><button>Trainer</button></a>
	<a href="/admin"><button>Admin</button></a>
</body>
</html>
