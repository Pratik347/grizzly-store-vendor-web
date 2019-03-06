<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%if(session.getAttribute("role").equals("Admin")){%>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
ul {
  list-style-type: none;
  margin: 0 auto;
  padding: 0;
  overflow: hidden;
  background-color: #D3D3D3;
}

li {
  float: left;
}

li a {
  display: block;padding: 20px;color: #DCDCDC;background-color: #D3D3D3;text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #A9A9A9;color: black;
  border-bottom: 2px solid black;
}

.active {
  background-color: #A9A9A9;color: black;
  border-bottom: 2px solid black;
}

</style>
</head>
<body>
   <ul>
      <li ><a class="active" href="#products">PRODUCTS</a></li>
      <li ><a href="#vendors">VENDORS</a></li>
   </ul><%} %>
   
<%if(session.getAttribute("role").equals("Vendor")){%>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
ul {
  list-style-type: none;
  margin: 0 auto;
  padding: 0;
  overflow: hidden;
  background-color: #D3D3D3;
}

li {
  float: left;
}

li a {
  display: block;padding: 20px;color: #DCDCDC;background-color: #D3D3D3;text-decoration: none;
}

li a:hover {
  background-color: #A9A9A9;color: black;
  border-bottom: 2px solid black;
}

</style>
</head>
<body>
   <ul>
      <li ><a  href="StoreServlet?display=product" target="iframe_a">PRODUCTS</a></li>
      <li ><a href="StoreServlet?display=inventory" target="iframe_a">INVENTORY</a></li>
   </ul><%} %>

</body>
</html>