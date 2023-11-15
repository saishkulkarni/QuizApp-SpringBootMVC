<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Select Question Type</title>
<style>
body {
	margin: 0;
	padding: 0;
	background-image: url("../images/bg1.jpg");
	background-size: cover;
}

.container {
	max-width: 1000px;
	margin: 0 auto;
	padding: 20px;
	border-radius: 15px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
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

form {
	margin: 20px;
	background-color: transparent;
}

input[type="text"], input[type="number"], textarea, select {
	padding: 10px;
	width: 350px;
	box-sizing: border-box;
	opacity: 0.7;
}

.button-33 {
	background-color: #c2fbd7;
	border-radius: 100px;
	box-shadow: rgba(44, 187, 99, .2) 0 -25px 18px -14px inset,
		rgba(44, 187, 99, .15) 0 1px 2px, rgba(44, 187, 99, .15) 0 2px 4px,
		rgba(44, 187, 99, .15) 0 4px 8px, rgba(44, 187, 99, .15) 0 8px 16px,
		rgba(44, 187, 99, .15) 0 16px 32px;
	color: green;
	cursor: pointer;
	display: inline-block;
	font-family: CerebriSans-Regular, -apple-system, system-ui, Roboto,
		sans-serif;
	padding: 7px 20px;
	text-align: center;
	text-decoration: none;
	transition: all 250ms;
	border: 0;
	font-size: 16px;
	opacity: 0.7;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
}

.button-33:hover {
	box-shadow: rgba(44, 187, 99, .35) 0 -25px 18px -14px inset,
		rgba(44, 187, 99, .25) 0 1px 2px, rgba(44, 187, 99, .25) 0 2px 4px,
		rgba(44, 187, 99, .25) 0 4px 8px, rgba(44, 187, 99, .25) 0 8px 16px,
		rgba(44, 187, 99, .25) 0 16px 32px;
	transform: scale(1.05) rotate(-1deg);
	opacity: 1;
}

main {
	text-align: center;
}

label {
	display: block;
	font-size: 25px;
}

#back {
	background-color: #B0926A;
	color: black;
	position: absolute;
	left: 45%;
	padding: 20px 40px 20px 40px;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
	margin-top: 20px;
}

p.copyright {
	position: absolute;
	width: 95%;
	color: black;
	font-size: 20px;
	text-align: right;
	bottom: 0;
}

#question-type-dropdown {
	font-size: 16px;
	padding: 10px;
	margin: 10px 0;
}

.question-form {
	display: none;
	padding: 20px;
	margin: 10px 0;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
}

#question-type-header {
	font-size: 24px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<header>
			<h2>${pass}</h2>
			<h3>${fail}</h3>
			<h1>Select a Question Type</h1>
		</header>
		<main>
			<select id="question-type-dropdown" onchange="showQuestionForm()">
				<option value="">Select One Option</option>
				<option value="mcq">Multiple Choice Question</option>
				<option value="truefalse">True or False</option>
				<option value="descriptive">Descriptive</option>
			</select>

			<form action="/trainer/question-add-mcq" method="post"
				id="mcq-question" class="question-form">
				<h1>Multiple Choice Question</h1>
				<label for="question">Question</label> <input type="text"
					name="question" required> <label for="marks">Marks</label>
				<input type="number" name="marks"> <label for="optionA">Option
					A</label> <input type="text" name="optionA" required> <input
					type="radio" name="answer" value="A"> Correct Answer<br>

				<label for="optionB">Option B</label> <input type="text"
					name="optionB" required> <input type="radio" name="answer"
					value="B"> Correct Answer<br> <label for="optionC">Option
					C</label> <input type="text" name="optionC" required> <input
					type="radio" name="answer" value="C"> Correct Answer<br>

				<label for="optionD">Option D</label> <input type="text"
					name="optionD" required> <input type="radio" name="answer"
					value="D"> Correct Answer<br> <input type="submit"
					class="button-33" value="Submit">
			</form>


			<form action="/trainer/question-add-truefalse" method="post"
				id="truefalse-question" class="question-form">
				<h1>True or False Question</h1>
				<label for="truefalse-question-text">Question</label> <input
					type="text" name="question" id="truefalse-question-text" required><br>
				<label for="truefalse-marks">Marks</label> <input type="number"
					id="truefalse-marks" name="marks" required min="1" step="1"><br>
				<label for="truefalse-option-true">True</label> <input type="radio"
					name="answer" value="true"> Correct Answer<br> <label
					for="truefalse-option-false">False</label> <input type="radio"
					name="answer" value="false"> Correct Answer<br> <input
					type="submit" class="button-33" value="Submit">
			</form>

			<form action="/trainer/question-add-descriptive" method="post"
				id="descriptive-question" class="question-form">
				<h1>Descriptive Question</h1>
				<label for="descriptive-question-text">Question</label> <input
					type="text" id="descriptive-question-text" name="question" required><br>

				<label for="descriptive-marks">Marks</label> <input type="number"
					id="descriptive-marks" name="marks" required min="1" step="1"><br>
				<label for="descriptive-answer">Answer</label>
				<textarea id="descriptive-answer" name="answer" rows="4" cols="50"
					required></textarea>

				<input type="submit" class="button-33" value="Submit">
			</form>
		</main>
	</div>
	<a href="/trainer/home"><button id="back">Back</button></a>
	<footer>
		<p class="copyright">©Saish</p>
	</footer>

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
</html>
