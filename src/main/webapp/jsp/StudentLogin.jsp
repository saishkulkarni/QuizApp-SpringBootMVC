<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Login</title>
<link rel="stylesheet" href="../css/index.css">
<style>
body, h1, h2, h3, p {
    margin: 0;
    padding: 0;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
}

h1 {
    font-size: 48px; /* Larger font size */
    color: #333;
    margin: 40px 0; /* Increased margin */
    text-align: center; /* Center the text */
}

h2 {
    color: green;
    font-size: 36px; /* Larger font size */
}

h3 {
    color: red;
    font-size: 36px; /* Larger font size */
}

#login {
    background-color: #fff;
    max-width: 400px;
    margin: 0 auto;
    padding: 30px; /* Increased padding */
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

form {
    margin: 30px 0; /* Increased margin */
}

label {
    font-weight: bold;
    font-size: 24px; /* Larger font size */
}

input[type="text"], input[type="password"] {
    width: 100%;
    padding: 20px; /* Larger padding */
    margin: 15px 0; /* Increased margin */
    border: 2px solid #ccc; /* Thicker border */
    border-radius: 8px; /* Larger border radius */
}

button[type="submit"] {
    background-color: #007BFF;
    color: #fff;
    border: none;
    padding: 20px 30px; /* Larger padding */
    border-radius: 8px; /* Larger border radius */
    cursor: pointer;
    transition: background-color 0.3s;
}

button[type="reset"] {
    background-color: #ccc;
    color: #fff;
    border: none;
    padding: 20px 30px; /* Larger padding */
    border-radius: 8px; /* Larger border radius */
    cursor: pointer;
    transition: background-color 0.3s;
}

button[type="submit"]:hover, button[type="reset"]:hover {
    background-color: #0056b3;
}

a {
    text-decoration: none;
    color: #007BFF;
    font-size: 24px; /* Larger font size */
}
</style>
</head>
<body>
<h1>Welcome to Student Login Page</h1>
<h2>${pass}</h2>
<h3>${fail}</h3>
<div id="login">
<form action="/student/login" method="post">
    <table>
        <tr>
            <td><label for="email">Email:</label></td>
            <td><input type="text" id="email" name="email"></td>
        </tr>
        <tr>
            <td><label for="password">Password:</label></td>
            <td><input type="password" id="password" name="password"></td>
        </tr>
        <tr>
            <td><button type="submit">Login</button></td>
            <td><button type="reset">Cancel</button></td>
        </tr>
    </table>
</form>
<a href="#">Forgot Password?</a><br><br><a href="/student/signup"><button>Create New Account</button></a> <a href="/"><button>Back</button></a>
</div>

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
