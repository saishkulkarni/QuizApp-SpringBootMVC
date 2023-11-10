<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Test</title>
    <script>
        // Timer function
        function startTimer(duration, display) {
            var timer = duration, minutes, seconds;
            setInterval(function () {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.textContent = minutes + ":" + seconds;

                if (--timer < 0) {
                    // Automatically submit the form after 10 minutes
                    document.forms["testForm"].submit();
                }
            }, 1000);
        }

        // Execute the timer when the page loads
        window.onload = function () {
            var tenMinutes = 60 * ${test.duration},
                display = document.querySelector('#timer');
            startTimer(tenMinutes, display);
        };
    </script>
</head>
<body>

    <!-- Timer Display -->
    <div style="position: fixed; top: 10px; right: 10px;">
        Time Remaining: <span id="timer"></span>
    </div>

    <h3>Test Name: ${test.name}</h3>
    <h3>Batch Code: ${test.batchCode}</h3>
    <h3>Total Marks: ${test.totalMarks}</h3>
    <form id="testForm" name="testForm" action="/student/submit-test/${test.id}" method="POST">
        <!-- MCQ Section -->
        <c:if test="${test.mcqs != null && !test.mcqs.isEmpty()}">
            <h2>MCQ:</h2>
            <c:forEach var="question" items="${test.mcqs}">
                <b>${question.question} (${question.marks}) </b>
                <br>
                A: <input type="radio" required="required" name="answer[${question.id}]" value="A">${question.optionA}<br>
                B: <input type="radio" name="answer[${question.id}]" value="B">${question.optionB}<br>
                C: <input type="radio" name="answer[${question.id}]" value="C">${question.optionC}<br>
                D: <input type="radio" name="answer[${question.id}]" value="D">${question.optionD}<br>
            </c:forEach>
        </c:if>

        <!-- True/False Section -->
        <c:if test="${test.trueFalseQuestions != null && !test.trueFalseQuestions.isEmpty()}">
            <h2>True False:</h2>
            <c:forEach var="question" items="${test.trueFalseQuestions}">
                <b>${question.question} (${question.marks}) </b>
                <br>
                <input type="radio" name="answer[${question.id}]" value="true" required="required"> true<br>
                <input type="radio" name="answer[${question.id}]" value="false"> false<br>
            </c:forEach>
        </c:if>

        <!-- Descriptive Section -->
        <c:if test="${test.descriptiveQuestions != null && !test.descriptiveQuestions.isEmpty()}">
            <h2>Descriptive:</h2>
            <c:forEach var="question" items="${test.descriptiveQuestions}">
                <b>${question.question} (${question.marks}) </b>
                <br>
                <textarea cols="30" rows="3" required="required" name="answer[${question.id}]"></textarea>
                <br>
            </c:forEach>
        </c:if>

        <!-- Submit Button -->
        <br>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
