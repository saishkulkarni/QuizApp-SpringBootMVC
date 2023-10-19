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
	background-image: url("../images/bg1.jpg");
}

div {
	margin-top: 100px;
	justify-content: center;
	align-items: center;
}

h3 {
	color: red;
	font-size: 24px;
	margin: 10px 0;
}

h2 {
	color: green;
	font-size: 24px;
	margin: 10px 0;
	color: green;
}

a {
	text-decoration: none;
}

a button {
	display: inline-block;
	background-color: #007BFF;
	color: #fff;
	border: none;
	padding: 15px 30px;
	margin: 10px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
	font-size: 18px; /* Adjust the font size */
	text-align: center;
	text-transform: uppercase; /* Uppercase text */
	font-weight: bold;
	letter-spacing: 1px;
}

a button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<h2>${pass}</h2>
	<h3>${fail}</h3>
	<div>
		<a href="/student/login"><button>Student</button></a> <a
			href="/trainer/login"><button>Trainer</button></a> <a
			href="/admin/login"><button>Admin</button></a>
	</div>
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
