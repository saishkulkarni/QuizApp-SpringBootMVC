<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select Batch Code</title>
</head>
<body>
${fail}
	<form action="/student/add-batch" method="post">
		<c:forEach var="batch" items="${list}">
			<input type="checkbox" name="batchs" value="${batch.batchCode}">${batch.batchCode}
		</c:forEach>
		<button>Submit</button>
	</form>
</body>
</html>