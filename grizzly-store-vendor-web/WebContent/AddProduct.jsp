<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<body>

<h2>Add Product Details :-</h2>

<div>
  <form action="StoreServlet">
    Product Name<br>   <input type = "text" name = "name" placeholder="Enter Name..." required/>
    
    Product Category<br><select name = "category">
                <option value="Personal Care">Personal Care</option>
                <option value="Laptops">Laptops</option>
                <option value="Art Supplies">Art Supplies</option></select>
                
    Product Brand<br>   <input type = "text" name = "brand" placeholder="Enter Brand..." required/>

    Product Description<br><input type = "text" name = "description" placeholder="Enter Details..." required/>
    
    Product Rating<br>   <input type = "text" name = "rating" placeholder="Enter Rating..." required/>
             
    Product Price<br>   <input type = "text" name = "price" placeholder="Enter Price..."/ required>
    
    Product Buffer Value<br>   <input type = "text" name = "buffer" placeholder="Enter Buffer Value..."/ required>
  
    <input type="submit" name="Add" value="Add">
    <input type="submit" name="Cancel" value="Cancel">
  </form>
  <%if(request.getAttribute("msg")!=null){%><p style="font-family:arial;color:red;text-align:center;"><%= request.getAttribute("msg")%></p><%} %>
</div>

</body>
</html>