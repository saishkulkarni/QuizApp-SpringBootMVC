<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Fetch Students</title>
</head>
<body>
	<header>
		<h2>${pass}</h2>
		<h3>${fail}</h3>
	</header>
	<table border="1">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Picture</th>
			<th>Email</th>
			<th>Mobile</th>
			<th>Gender</th>
			<th>Status</th>
			<th>Change Status</th>
		</tr>

		<c:forEach var="student" items="${students}">
			<tr>
				<th>${student.getId()}</th>
				<th>${student.getName()}</th>
				<th><img
					src="data:image/jpeg;base64,${Base64.encodeBase64String(student.getPicture())}">
				</th>
				<th>${student.getEmail()}</th>
				<th>${student.getMobile()}</th>
				<th>${student.getGender()}</th>
				<th><c:if test="${student.isApproved()}">
				Approved
				</c:if> <c:if test="${!student.isApproved()}">
				Not Approved
				</c:if></th>
				<th><a href="/admin/student/change-status/${student.getId()}"><button>Change
							Status</button></a></th>
			</tr>
		</c:forEach>

	</table>
</body>
</html>