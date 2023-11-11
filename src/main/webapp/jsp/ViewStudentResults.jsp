<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Result</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background-image: url("/images/bg1.jpg");
	background-size: cover;
}

header {
	text-align: center;
	margin-bottom: 20px;
}

h1 {
	font-size: 48px;
	color: #333;
}

h2 {
	font-size: 30px;
	color: #A2FF86;
	margin: 10px 0;
}

h3 {
	font-size: 30px;
	color: #F94C10;
	margin: 10px 0;
}

table {
	width: 90%;
	border-collapse: collapse;
	margin: 0 auto;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
	mix-blend-mode: luminosity;
}

th, td {
	text-align: center;
	padding: 10px;
	border: 1px solid #ddd;
}

th {
	background-color: #007bff;
	color: #fff;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

img {
	max-width: 100px;
	max-height: 100px;
}

button {
	padding: 5px 10px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}

@media ( min-width : 768px) {
	.button {
		padding: 0.3em 0.9em;
	}
}

p.copyright {
	width: 95%;
	color: black;
	font-size: 20px;
	text-align: right;
	bottom: 0;
}

#back {
	background-color: #B0926A;
	color: black;
	position: absolute;
	left: 45%;
	padding: 20px 40px 20px 40px;
	font-size: 20px;
	margin-top: 20px;
	font-weight: bold;
}
</style>
</head>
<body>
	<header>
		<h2>${pass}</h2>
		<h3>${fail}</h3>
		<h1>All Student Details</h1>
	</header>
	<table border="1">
		<tr>
			<th>Test Name</th>
			<th>Batch Code</th>
			<th>Total Marks</th>
			<th>Obtained Marks</th>
			<th>Percentage</th>
			<th>See Answers</th>
		</tr>

		<c:forEach var="result" items="${results}">
			<tr>
				<td>${result.testName}</td>
				<td>${result.batchCode}</td>
				<td>${result.totalMarks}</td>
				<td>${result.obtainedMarks}</td>
				<td>${result.percentage}</td>
				<td><button onclick="showAnswers()">Click</button></td>
			</tr>

		</c:forEach>
	</table>
	<br>
	<div id="answersDiv" style="display: none;">
	<table border="1">
		<tr>
			<th>Question</th>
			<th>Students Answer</th>
			<th>Correct Answer</th>
			<th>Obtained Marks</th>
			</tr>

		<c:forEach var="question" items="">
			<tr>
				<td>${question.question}</td>
				<td>${question.studentAnswer}</td>
				<td>${question.correctAnswer}</td>
				<td>${question.marks}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	
	<a href="/student/home"><button id="back">Back</button></a>

	<footer>
		<p class="copyright">©Saish</p>
	</footer>

	<script type="text/javascript">
		function showAnswers() {
			var answersDiv = document.getElementById('answersDiv');

			if (answersDiv.style.display === 'none') {
				answersDiv.style.display = 'block';

			} else {
				answersDiv.style.display = 'none';
			}
		}
	</script>

	<script>
		setTimeout(function() {
			var h2 = document.querySelector('h2');
			var h3 = document.querySelector('h3');

			if (h2 && h3) {
				h2.style.display = 'none';
				h3.style.display = 'none';
			}
		}, 1000);
	</script>
</body>
</html>