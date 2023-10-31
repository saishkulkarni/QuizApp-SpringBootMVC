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
	<h1>Trainer Home</h1>
	<a href="/trainer/add-batchcode"><button>Create Batch Code</button></a>
	<a href="/trainer/add-question"><button>Add Question</button></a>
	<a href="/trainer/create-test"><button>Create Test</button></a>
	<a href="/trainer/fetch-results"><button>See Previous
			Result</button></a>
	<a href="/logout"><button>Logout</button></a>
</body>
</html>