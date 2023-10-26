<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
${fail }
	<form action="/student/forgot-password" method="post">
		Email:<input type="email" name="email">
		<button>Submit</button>
	</form>
</body>
</html>