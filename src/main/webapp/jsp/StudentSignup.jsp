<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
        }
        h3 {
            text-align: center;
        }
        form {
            text-align: center;
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            width: 300px;
            margin: 0 auto;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        label {
            display: block;
            text-align: left;
            margin: 5px 0;
        }
        input[type="text"],
        input[type="email"],
        input[type="number"],
        input[type="password"],
        input[type="file"] {
            width: 100%;
            padding: 5px;
            margin: 5px 0;
        }
        input[type="radio"] {
            margin: 0 5px;
        }
        #submit {
            background-color: #0074d9;
            color: #fff;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }
        #submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Student signup page</h1>
    <h3>Enter details</h3>
    <form action="" method="post">
        <table>
            <tr>
                <td><label for="name">Name:</label></td>
                <td><input type="text" id="name" name="name"></td>
            </tr>
            <tr>
                <td><label for="email">Email:</label></td>
                <td><input type="email" id="email" name="email"></td>
            </tr>
            <tr>
                <td><label for="mobile">Mobile:</label></td>
                <td><input type="number" id="mobile" name="mobile"></td>
            </tr>
            <tr>
                <td><label for="password">Password:</label></td>
                <td><input type="password" id="password" name="password"></td>
            </tr>
            <tr>
                <td><label for="gender">Gender:</label></td>
                <td>
                    <input type="radio" value="female" name="gender">Female
                    <input type="radio" value="male" name="gender">Male
                </td>
            </tr>
            <tr>
                <td><label for="picture">Picture:</label></td>
                <td><input id="picture" type="file" name="pic"></td>
            </tr>
            <tr>
                <td><a href=""><button id="submit">Create</button></a></td>
                <td><button type="reset">Cancel</button></td>
            </tr>
        </table>
    </form>
</body>
</html>
