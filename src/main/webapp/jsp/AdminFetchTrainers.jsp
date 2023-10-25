<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Fetch Trainers</title>
</head>
<body>
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
				<th>${trainer.getId()}</th>
				<th>${trainer.getName()}</th>
				<th>
				<img src="data:image/jpeg;base64,${Base64.encodeBase64String(trainer.getPicture())}">
				</th>
				<th>${trainer.getEmail()}</th>
				<th>${trainer.getMobile()}</th>
				<th>${trainer.getEid()}</th>
				<th>${trainer.getGender()}</th>
				<th>${trainer.getSubject()}</th>
				<th><c:if test="${trainer.isApproved()}">
				Approved
				</c:if> <c:if test="${!trainer.isApproved()}">
				Not Approved
				</c:if></th>
				<th><button>Change Status</button></th>
			</tr>
		</c:forEach>

	</table>
</body>
</html>