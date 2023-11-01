<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Select Questions</h1>


	<form action="/trainer/add-test-questions" method="post">
		<input type="text" hidden="hidden" value="${id}" name="id">
		<c:if test="${!list1.isEmpty()}">
			<fieldset>
				<legend>MCQs</legend>
				<table>
					<tr>
						<th>Question Id</th>
						<th>Question</th>
						<th>Option A</th>
						<th>Option B</th>
						<th>Option C</th>
						<th>Option D</th>
						<th>Answer</th>
						<th>Marks</th>
						<th>Subject</th>
						<th>Select</th>
					</tr>
					<c:forEach var="question" items="${list1}">
						<tr>
							<th>${question.id}</th>
							<th>${question.question}</th>
							<th>${question.optionA}</th>
							<th>${question.optionB}</th>
							<th>${question.optionC}</th>
							<th>${question.optionD}</th>
							<th>${question.answer}</th>
							<th>${question.marks}</th>
							<th>${question.subject}</th>
							<th><input type="checkbox" name="mcqs"
								value="${question.id}"></th>
						</tr>
					</c:forEach>
				</table>

			</fieldset>
		</c:if>

		<c:if test="${!list2.isEmpty()}">
			<fieldset>
				<legend>True False</legend>
				<table>
					<tr>
						<th>Question Id</th>
						<th>Question</th>
						<th>Answer</th>
						<th>Marks</th>
						<th>Subject</th>
						<th>Select</th>
					</tr>
					<c:forEach var="question" items="${list2}">
						<tr>
							<th>${question.id}</th>
							<th>${question.question}</th>
							<th>${question.answer}</th>
							<th>${question.marks}</th>
							<th>${question.subject}</th>
							<th><input type="checkbox" name="trueFalseQuestions"
								value="${question.id}"></th>
						</tr>
					</c:forEach>
				</table>
			</fieldset>
		</c:if>

		<fieldset>
			<legend>Descriptive</legend>
			<table>
				<tr>
					<th>Question Id</th>
					<th>Question</th>
					<th>Answer</th>
					<th>Marks</th>
					<th>Subject</th>
					<th>Select</th>
				</tr>
				<c:forEach var="question" items="${list3}">
					<tr>
						<th>${question.id}</th>
						<th>${question.question}</th>
						<th>${question.answer}</th>
						<th>${question.marks}</th>
						<th>${question.subject}</th>
						<th><input type="checkbox" name="descriptiveQuestions"
							value="${question.id}"></th>
					</tr>
				</c:forEach>
			</table>
		</fieldset>
		<button>Add</button>
	</form>
</body>
</html>