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
	Select Batch:
	<select id="batchSelect" onchange="createDiv()">
		<c:forEach var="batch" items="${batchs}">
			<c:set var="tests" value="${batch.tests}"></c:set>
			<option>${batch.batchCode}</option>
		</c:forEach>
	</select>

	<div id="dynamicDiv">
	<table border="1">
	<tr>
	<th></th>
	</tr>
	</table>
	</div>


	<script>
		function createDiv() {
			var selectedBatch = document.getElementById("batchSelect").value;
			var dynamicDiv = document.getElementById("dynamicDiv");
			if (selectedBatch !== "default") {
				dynamicDiv.style.display = "block";
			} else {
				dynamicDiv.style.display = "none";
			}
		}
	</script>
</body>
</html>