<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
</head>
<body>
	<c:if test="${result.percentage>=60}">
		<h1>Congratss You cleared Test</h1>
	</c:if>
	<c:if test="${result.percentage<60}">
		<h1>BadLuck You Failed Test</h1>
	</c:if>

	Test Name:${resul.testName}
	<br> Batch Code:${result.batchCode}
	<br> Total Marks:${result.totalMarks}
	<br> Obtained Marks:${result.obtainedMarks}
	<br>Percentage:${result.percentage}

</body>
</html>