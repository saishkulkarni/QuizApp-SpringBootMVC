<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#dynamicDiv {
	display: none; /* Hide the div initially */
	border: 1px solid #ccc;
	padding: 10px;
	margin-top: 10px;
}
</style>
<meta charset="ISO-8859-1">
<title>Result</title>
</head>
<body>
${fail }
	<form action="/trainer/batch/tests" method="post">
		Select Batch: <select name="batchCode">
			<c:forEach var="batch" items="${batchs}">
				<option>${batch.batchCode}</option>
			</c:forEach>
		</select>
		<button>Submit</button>
	</form>
</body>
</html>