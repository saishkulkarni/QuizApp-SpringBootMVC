<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Test</title>
</head>
<body>

	<h3>Test Name: ${test.name}</h3>
	<h3>Batch Code: ${test.batchCode}</h3>
	<h3>Total Marks: ${test.totalMarks}</h3>
	<form action="/student/submit-test/${test.id}" method="POST">
		<c:if test="${test.mcqs != null && !test.mcqs.isEmpty()}">
			<h2>MCQ:</h2>
			<c:forEach var="question" items="${test.mcqs}">
				<b>${question.question} (${question.marks}) </b>
				<br>
                A: <input type="radio" required="required"
					name="answer[${question.id}]" value="A">${question.optionA}<br>
                B: <input type="radio" name="answer[${question.id}]"
					value="B">${question.optionB}<br>
                C: <input type="radio" name="answer[${question.id}]"
					value="C">${question.optionC}<br>
                D: <input type="radio" name="answer[${question.id}]"
					value="D">${question.optionD}<br>
			</c:forEach>
		</c:if>
		<c:if
			test="${test.trueFalseQuestions != null && !test.trueFalseQuestions.isEmpty()}">
			<h2>True False:</h2>
			<c:forEach var="question" items="${test.trueFalseQuestions}">
				<b>${question.question} (${question.marks}) </b>
				<br>
				<input type="radio" name="answer[${question.id}]" value="true"
					required="required"> true<br>
				<input type="radio" name="answer[${question.id}]" value="false"> false<br>
			</c:forEach>
		</c:if>
		<c:if
			test="${test.descriptiveQuestions != null && !test.descriptiveQuestions.isEmpty()}">
			<h2>Descriptive:</h2>
			<c:forEach var="question" items="${test.descriptiveQuestions}">
				<b>${question.question} (${question.marks}) </b>
				<br>
				<textarea cols="30" rows="3" required="required"
					name="answer[${question.id}]"></textarea>
				<br>
			</c:forEach>
		</c:if>
		<br>
		<button type="submit">Submit</button>
	</form>
</body>
</html>
