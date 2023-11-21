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
${fail }
<form action="/trainer/batch/result" method="post">
		Select Quiz: <select name="name" >
			<c:forEach var="quiz" items="${list}">
				<option>${quiz.name}</option>
			</c:forEach>
		</select>
		<button>Submit</button>
	</form>
</body>
</html>