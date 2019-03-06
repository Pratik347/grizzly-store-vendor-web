<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Stock</title>
<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
</head>
<body>
<h2>Update Stock:-</h2>

<div>
  <form action="StoreServlet">
    Product ID<br>   <input type = "text" name = "idManaged" value = "<%=request.getAttribute("id")%>" readonly/>
    
    Product Buffer<br><input type = "text" name = "buffer" value = "<%=request.getAttribute("buffer")%>" readonly />
                
    Product Stock<br>   <input type = "text" name = "stock" placeholder="Enter stock..." required/>    
  
    <input type="submit" name="Update" value="Update">
    <input type="submit" name="Cancel" value="Cancel">
  </form>
  <%if(request.getAttribute("msg")!=null){%><p style="font-family:arial;color:red;text-align:center;"><%= request.getAttribute("msg")%></p><%} %>
</div>
</body>
</html>