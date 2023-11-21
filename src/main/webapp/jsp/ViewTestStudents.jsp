<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Result</title>
</head>
<body>
	<h1>Student who have Taken Test</h1>
	<table border="1">
		<tr>
			<th>Student Name</th>
			<th>Student Mobile</th>
			<th>Total Test Marks</th>
			<th>Student Score</th>
			<th>See Answers</th>
		</tr>
		<c:forEach var="result" items="${results}">
			<tr>
				<td>${result.student.name}</td>
				<td>${result.student.mobile }</td>
				<td>${result.totalMarks}</td>
				<td>${result.obtainedMarks}</td>
				<td><a href="/trainer/test/questions/${result.id}"><button>Click</button></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>