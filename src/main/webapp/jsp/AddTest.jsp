<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Test</title>
</head>
<body>
	<form action="/trainer/create-test" method="post">
		Enter Test Name:<input type="text" name="name"><br>
		Batch Code:
		<select name="batchCode">
		<option value="">Select One Batch Code</option>
		<c:forEach var="batch" items="${batchs}">
		<option>${batch.getBatchCode()}</option>
		</c:forEach>
		</select>
		<br>
		Enter Starting Time:<input type="datetime-local" name="startTime"><br>
		Enter Duration in Minutes:<input type="number" name="duration"><br>
		<button>Add</button>
	</form>
</body>
</html>