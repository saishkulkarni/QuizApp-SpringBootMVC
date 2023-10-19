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
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
}

h2, h3 {
	font-size: 24px;
	color: #333;
	margin: 10px 0;
}

a {
	text-decoration: none;
}

a button {
	display: inline-block;
	background-color: #007BFF;
	color: #fff;
	border: none;
	padding: 10px 20px;
	margin: 10px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

a button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<h2>${pass}</h2>
	<h3>${fail}</h3>
	<a href="/student/login"><button>Student</button></a>
	<a href="/trainer/login"><button>Trainer</button></a>
	<a href="/admin/login"><button>Admin</button></a>

	<script>
		setTimeout(function() {
			document.getElementById('pass').style.display = 'none';
			document.getElementById('fail').style.display = 'none';
		}, 1000);
	</script>
</body>
</html>
