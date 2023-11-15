<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Batch</title>

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
}

input[type="text"] {
	padding: 10px;
	width: 350px;
	box-sizing: border-box;
	opacity: 0.5;
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
	top: 40vh;
	padding: 20px 40px 20px 40px;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
}

p.copyright {
	position: absolute;
	width: 95%;
	color: black;
	font-size: 20px;
	text-align: right;
	bottom: 0;
}
</style>
</head>
<body>
	<div class="container">
		<header>
			<h2>${pass}</h2>
			<h3>${fail}</h3>
			<h1>Create Batch Code</h1>
		</header>
		<main>
			<form action="/trainer/add-batchcode" method="post">
				<label for="batchCode">Batch Code</label> <input type="text"
					name="batchCode" required="required">
				<button class="button-33">Create</button>
			</form>
		</main>
	</div>
	<a href="/trainer/home"><button id="back">Back</button> </a>
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
