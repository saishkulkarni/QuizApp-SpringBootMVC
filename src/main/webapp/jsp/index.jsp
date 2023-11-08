<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
body {
	margin: 0;
	padding: 0;
	background-image: url("/images/bg1.jpg");
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

main {
	text-align: center;
}

.buttons {
	margin: 20px 0;
}

.button {
	font-family: "Open Sans", sans-serif;
	margin: 5px;
	font-size: 20px;
	letter-spacing: 2px;
	color: #000;
	padding: 0.35em 0.8em;
	box-shadow: 1px 1px 0px 0px, 2px 2px 0px 0px, 3px 3px 0px 0px, 4px 4px
		0px 0px, 5px 5px 0px 0px;
	position: relative;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
	text-decoration: none;
	text-transform: uppercase;
	cursor: pointer;
	border: 5px solid;
	color: #000;
	font-size: 20px;
}

.button:active {
	box-shadow: 0px 0px 0px 0px;
	top: 5px;
	left: 5px;
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
</style>

</head>
<body>
	<div class="container">
		<header>
			<h2>${pass}</h2>
			<h3>${fail}</h3>
			<h1>Welcome to Quiz Application</h1>
		</header>
		<main>
			<div class="buttons">
				<a href="/student/login" class="button">Student</a> <a
					href="/trainer/login" class="button">Trainer</a> <a
					href="/admin/login" class="button">Admin</a>
			</div>
		</main>
	</div>
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
