<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
<h2 style="color:green">${pass}</h2>
<h3 style="color:red">${fail}</h3>
	<a href="/student/login"><button>Student</button></a>
	<a href="/trainer/login"><button>Trainer</button></a>
	<a href="/admin/login"><button>Admin</button></a>
</body>
</html>