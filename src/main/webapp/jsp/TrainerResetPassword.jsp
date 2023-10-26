<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="/trainer/reset-password" method="post"> <input
			type="text" name="id" value="${id}" hidden="hidden"> Enter
		New Password:<input type="password" name="password">
		<button>Reset</button>
	</form>
</body>
</html>