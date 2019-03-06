<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pms.pojo.ProductPojo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fetch Product</title>
<link rel="stylesheet" type="text/css" href="FetchProduct.css">
<style> 

table, th, td { border: 1px solid black;
                        border-collapse: collapse;}   
                        
td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  border-right: 1px solid #ddd;
}

th {
  padding: 8px;
  text-align: centre;
  border-bottom: 2px solid #ddd;
  border-right: 1px solid #ddd;
}     
</style>
</head>

<body>
<div>
<%

if(session.getAttribute("role").equals("Admin"))
{

%>	
	<ul><li style="list-style-type: none;"><a id="button2" href ="StoreServlet?AddProduct=AddProduct">Add Product</a></li></ul>
	<%
		ArrayList arrayList = (ArrayList) request.getAttribute("arrayList");
	
		Iterator<ProductPojo> iterator = arrayList.iterator();
	
		out.println("<table style=\"width:100%\">");
		out.println("<tr style=\"font-family:arial;color:lightgrey;\">");
		out.println("<th>Product List</th>");
		out.println("<th>Brand</th>");
		out.println("<th>Category</th>");
		out.println("<th>Rating</th>");
		out.println("<th></th>");
		out.println("</tr>");
	
		while(iterator.hasNext())
		{
			ProductPojo pojo = (ProductPojo) iterator.next();
			out.println("<tr style=\"font-family:arial;\">");
			out.println("<td>"+pojo.getProductName()+"</td>");
			out.println("<td>"+pojo.getProductBrand()+"</td>");	
			out.println("<td>"+pojo.getProductCategory()+"</td>");
			out.println("<td>"+pojo.getProductRating()+"</td>");
	%>
			<td><a id="button" href ="StoreServlet?id=<%= pojo.getProductId()%>"> Remove </a></td>
		
	<%
			out.println("</tr>");
		}
		out.println("</table>");
}

if(session.getAttribute("role").equals("Vendor"))
{
	
     if((request.getAttribute("display") !=null && request.getAttribute("display").equals("product")) || (request.getAttribute("remove")!=null && request.getAttribute("remove").equals("remove")))
     {
     
     	ArrayList arrayList = (ArrayList) request.getAttribute("arrayList");

	    Iterator<ProductPojo> iterator = arrayList.iterator();

	    out.println("<table style=\"width:100%\">");
	    out.println("<tr style=\"font-family:arial;color:lightgrey;\">");
	    out.println("<th>Product List</th>");
	    out.println("<th>ID</th>");
	    out.println("<th>Brand</th>");
	    out.println("<th>Category</th>");
	    out.println("<th></th>");
	    out.println("</tr>");

	    while(iterator.hasNext())
	    {
		ProductPojo pojo = (ProductPojo) iterator.next();
		out.println("<tr style=\"font-family:arial;\">");
		out.println("<td>"+pojo.getProductName()+"</td>");
		out.println("<td>"+pojo.getProductId()+"</td>");	
		out.println("<td>"+pojo.getProductBrand()+"</td>");
		out.println("<td>"+pojo.getProductCategory()+"</td>");
	 %>
		<td><a id="button" href ="StoreServlet?id=<%= pojo.getProductId()%>"> Remove </a></td>
		
	 <%
	 	out.println("</tr>");
	    }
	    out.println("</table>");
     }
     
     if(request.getAttribute("display")!=null && request.getAttribute("display").equals("inventory"))
     {
     
    	ArrayList arrayList = (ArrayList) request.getAttribute("arrayList");

	    Iterator<ProductPojo> iterator = arrayList.iterator();

	    out.println("<table style=\"width:100%\">");
	    out.println("<tr style=\"font-family:arial;color:lightgrey;\">");
	    out.println("<th>Product List</th>");
	    out.println("<th>ID</th>");
	    out.println("<th>In Stock</th>");
	    out.println("<th>Req.</th>");
	    out.println("<th>Buffer</th>");
	    out.println("<th>Price/Item</th>");
	    out.println("<th>Rating</th>");
	    out.println("<th></th>");
	    out.println("</tr>");

	    while(iterator.hasNext())      
	    {
		ProductPojo pojo = (ProductPojo) iterator.next();
		out.println("<tr style=\"font-family:arial;\">");
		out.println("<td>"+pojo.getProductName()+"</td>");
		out.println("<td>"+pojo.getProductId()+"</td>");	
		out.println("<td>"+pojo.getProductStock()+"</td>");
		int buffer=Integer.parseInt(pojo.getProductBuffer());
		int stock= Integer.parseInt(pojo.getProductStock());
		int required=buffer-stock;
		if(required<=0){
			out.println("<td>0</td>");
		}
		else{
			out.println("<td>"+required+"</td>");
		}
		out.println("<td>"+pojo.getProductBuffer()+"</td>");
		out.println("<td>"+pojo.getProductPrice()+"</td>");
		out.println("<td>"+pojo.getProductRating()+"</td>");
	  %>
		<td><a id="button" href ="StoreServlet?idManage=<%=pojo.getProductId()%>&stock=<%=pojo.getProductStock()%>&buffer=<%=pojo.getProductBuffer()%>"> Manage </a></td>
		
	  <%
	  	out.println("</tr>");
	   }
	   out.println("</table>");
	 }
}

%>
</div>
</body>
</html>