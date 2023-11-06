<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
${pass}${fail}
	<h1>Student Home</h1>
	<a href="/student/add-batchcode"><button>Select Batch Code</button></a>
	<br><br>
	<a href="/student/show-test"><button>Take Test</button></a>
	<br><br>
	<a href=""><button>View Previous Test Results</button></a>
	<br><br>
	<a href="/logout"><button>Logout</button></a>
	<br><br>
</body>
</html>