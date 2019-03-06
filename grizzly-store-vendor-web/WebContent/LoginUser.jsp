<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Login User</title>
<link rel="stylesheet" type="text/css" href="LoginUser.css">
</head>

<body>
<img src="login.jpg" width="100%" height="300"><br><br><br>
<form action = "StoreServlet" method = "get">
<input class="textbox" type = "text" name = "user" placeholder="Username" required/><br><br>
<input class="textbox" type = "password" name = "pass" placeholder="Password" required/><br><br>
<input id="login" type = "submit" name = "Login" value = "Login"/>
</form>
<p style="font-family:arial;color:red;text-align:center">Invalid Username or Password !!</p>
</body>
</html>