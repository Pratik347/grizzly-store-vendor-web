<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Layout</title>
<link rel="stylesheet" type="text/css" href="Stylesheet.css">
<style></style>
</head>
<body>
<header>
     <ul id="left-nav">
       <li><img src="logo.png" width="200px" height="50px"></li>
     </ul>
     
     <ul id="right-nav">
       <li>Welcome, <%=session.getAttribute("role")%> <%=session.getAttribute("user")%></li>
       <li class="button"><a id="button" href ="StoreServlet?Logout=Logout">Logout</a></li>
     </ul>
</header>
<div id="left"></div>
<div id="right"></div>
<div id="top"></div>
<div id="bottom"></div>
<%if(session.getAttribute("role").equals("Vendor")){%>
<ul >
<li style="display:inline-block;margin:10px;"><iframe src="UserProfile.jsp" style="height:500px;width:300px" scrolling="no"></iframe></li>
<li style="display:inline-block;margin:10px;"><ul><li><iframe src="NavBars.jsp" style="height:75px;width:1000px"></iframe></li>
                                                  <li style="margin-top:20px;"><iframe src="StoreServlet?display=product" style="height:396.5px;width:1000px" name="iframe_a"></iframe></li>
                                              </ul>
</li>
</ul>
<% }%>
<%if(session.getAttribute("role").equals("Admin")){%>
<ul >
<li style="display:inline-block;margin:10px;"><iframe src="UserProfile.jsp" style="height:500px;width:300px" scrolling="no"></iframe></li>
<li style="display:inline-block;margin:10px;"><ul><li><iframe src="NavBars.jsp" style="height:75px;width:1000px"></iframe></li>
                                                  <li style="margin-top:20px;"><iframe src="AddProduct.jsp" style="height:396.5px;width:1000px"></iframe></li>
                                              </ul>
</li>
</ul>
<% }%>
</body>
</html>