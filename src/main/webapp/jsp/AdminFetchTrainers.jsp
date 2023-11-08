<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Fetch Trainers</title>
<style>
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
	position: absolute;
	width: 95%;
	color: black;
	font-size: 20px;
	text-align: right;
	bottom: 0;
}

#back {
	background-color:#B0926A;
	color:black;
	position: absolute;
	left: 45%;
	top: 40vh;
	padding: 20px 40px 20px 40px;
	font-size: 20px;
	font-weight: bold;
}
</style>
</head>
<body>
	<header>
		<h2>${pass}</h2>
		<h3>${fail}</h3>
		<h1>All Trainer Details</h1>
	</header>
	<table border="1">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Picture</th>
			<th>Email</th>
			<th>Mobile</th>
			<th>Employee Id</th>
			<th>Gender</th>
			<th>Subject</th>
			<th>Status</th>
			<th>Change Status</th>
		</tr>

		<c:forEach var="trainer" items="${trainers}">
			<tr>
				<td>${trainer.getId()}</td>
				<td>${trainer.getName()}</td>
				<td><img
					src="data:image/jpeg;base64,${Base64.encodeBase64String(trainer.getPicture())}"></td>
				<td>${trainer.getEmail()}</td>
				<td>${trainer.getMobile()}</td>
				<td>${trainer.getEid()}</td>
				<td>${trainer.getGender()}</td>
				<td>${trainer.getSubject()}</td>
				<td><c:if test="${trainer.isApproved()}">
                        Approved
                    </c:if> <c:if test="${!trainer.isApproved()}">
                        Not Approved
                    </c:if></td>
				<td><a href="/admin/trainer/change-status/${trainer.getId()}"><button>Change
							Status</button></a></td>
			</tr>
		</c:forEach>
	</table>
	<a href="/admin/home"><button id="back">Back</button></a>
	<footer>
		<p class="copyright">©Saish</p>
	</footer>
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
