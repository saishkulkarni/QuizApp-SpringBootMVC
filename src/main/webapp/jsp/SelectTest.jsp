<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="test" items="${tests}">
Test Id:${test.id}<br>
Test Name:${test.name}<br>
		<a href="/student/start-test/${test.id}"><button>Start</button></a>
		<br>
	</c:forEach>
	.
</body>
</html>