<!DOCTYPE html>
<html>
<head>
<style>
#question-type-dropdown {
	font-size: 16px;
	padding: 10px;
	margin: 10px 0;
}

.question-form {
	display: none;
	background-color: #f0f0f0;
	padding: 20px;
	margin: 10px 0;
}

label {
	display: block;
	font-weight: bold;
	margin-top: 10px;
}

input[type="text"], input[type="number"], textarea {
	width: 100%;
	padding: 5px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

input[type="radio"] {
	margin-right: 5px;
}

input[type="submit"] {
	padding: 10px 20px;
	background-color: #0073e6;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#question-type-header {
	font-size: 24px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<h1>Select a Question Type</h1>
	<select id="question-type-dropdown" onchange="showQuestionForm()">
		<option value="">Select One Option</option>
		<option value="mcq">Multiple Choice Question</option>
		<option value="truefalse">True or False</option>
		<option value="descriptive">Descriptive</option>
	</select>

	<form action="/trainer/question-add-mcq" method="post"
		id="mcq-question" class="question-form">
		<h2>Multiple Choice Question</h2>
		Write Question:<input type="text" name="question" required><br>
		Marks:<input type="number" name="marks"> Option A:<input
			type="text" name="optionA" required> <input type="radio"
			name="answer" value="A"> Correct Answer<br> Option B:<input
			type="text" name="optionB" required> <input type="radio"
			name="answer" value="B"> Correct Answer<br> Option C:<input
			type="text" name="optionC" required> <input type="radio"
			name="answer" value="C"> Correct Answer<br> Option D:<input
			type="text" name="optionD" required> <input type="radio"
			name="answer" value="D"> Correct Answer<br> <input
			type="submit" value="Submit">
	</form>

	<form action="/trainer/question-add-truefalse" method="post"
		id="truefalse-question" class="question-form">
		<h2>True or False Question</h2>
		<label for="truefalse-question-text">Write Question:</label> <input
			type="text" name="question" id="truefalse-question-text" required><br>
		<label for="truefalse-marks">Marks:</label> <input type="number"
			id="truefalse-marks" name="marks" required min="1" step="1"><br>
		<label for="truefalse-option-true">True:</label> <input type="radio"
			name="answer" value="true"> Correct Answer<br> <label
			for="truefalse-option-false">False:</label> <input type="radio"
			name="answer" value="false"> Correct Answer<br> <input
			type="submit" value="Submit">
	</form>

	<form action="/trainer/question-add-descriptive" method="post"
		id="descriptive-question" class="question-form">
		<h2>Descriptive Question</h2>
		<label for="descriptive-question-text">Write Question:</label> <input
			type="text" id="descriptive-question-text" name="question" required><br>

		<label for="descriptive-marks">Marks:</label> <input type="number"
			id="descriptive-marks" name="marks" required min="1" step="1"><br>
		<label for="descriptive-answer">Write Answer:</label>
		<textarea id="descriptive-answer" name="answer" rows="4" cols="50"
			required></textarea>

		<input type="submit" value="Submit">
	</form>

	<script>
		function showQuestionForm() {
			var dropdown = document.getElementById("question-type-dropdown");
			var selectedOption = dropdown.value;
			var questionForms = document.querySelectorAll(".question-form");
			var header = document.getElementById("question-type-header");

			questionForms.forEach(function(form) {
				form.style.display = "none";
			});

			if (selectedOption === "mcq") {
				document.getElementById("mcq-question").style.display = "block";
				header.innerText = "Multiple Choice Question";
			} else if (selectedOption === "truefalse") {
				document.getElementById("truefalse-question").style.display = "block";
				header.innerText = "True or False Question";
			} else if (selectedOption === "descriptive") {
				document.getElementById("descriptive-question").style.display = "block";
				header.innerText = "Descriptive Question";
			}
		}
	</script>
</body>