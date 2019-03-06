<%@page import="com.pms.pojo.LoginPojo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
text-align:center;
margin-top:15px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>
</head>
<body>
<%
LoginPojo pojo= new LoginPojo();
%>
<img src="profile.png" width="100" height="100"><br><br><br>
<h2><%=session.getAttribute("user")%> (<%=session.getAttribute("role")%>)</h2>
<h4><%=session.getAttribute("rating")%></h4><br>
<h4>Contact</h4>
<h4><%=session.getAttribute("contact")%></h4><br>
<h4>Address</h4>
<h4><%=session.getAttribute("address")%></h4><br>
</body>
</html>