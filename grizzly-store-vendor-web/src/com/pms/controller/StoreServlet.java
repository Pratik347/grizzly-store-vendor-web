package com.pms.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.pms.dao.LoginDao;
import com.pms.dao.ProductDao;
import com.pms.java.ApplicationException;
import com.pms.pojo.LoginPojo;
import com.pms.pojo.ProductPojo;
import com.pms.validation.InputValidation;

@WebServlet("/StoreServlet")
public class StoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static Logger log = Logger.getLogger("grizzly-store-vendor-web");
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("Login")!=null) {
			try {
			String name=request.getParameter("user");
            String password=request.getParameter("pass");

            LoginPojo pojo=new LoginPojo();
            pojo.setUsername(name);

            pojo=LoginDao.fetchUserDetails(pojo);
            
            if(pojo.getStatus()==null)
            {
          	  RequestDispatcher rd=request.getRequestDispatcher("LoginUser.jsp");
                rd.forward(request, response);            	  
            }
            else if(pojo.getStatus().equals("enabled"))
                   
            {
               if(pojo.getPassword().equals(password))
                   {                                           
                         HttpSession session=request.getSession();
                         session.setAttribute("user", name);
                         session.setAttribute("role", pojo.getRole());
                         session.setAttribute("rating", pojo.getRating());
                         session.setAttribute("contact", pojo.getContact());
                         session.setAttribute("address", pojo.getAddress());
                         session.removeAttribute("attempt");
             			 RequestDispatcher requestDispatcher = request.getRequestDispatcher("Layout.jsp");
             			 requestDispatcher.forward(request, response);                      
                   }
               else
                   {
                   HttpSession session=request.getSession();
                   String user=(String) session.getAttribute("user");
                   if(request.getParameter("user").equals(user))
                   {
                      	 String attempt=(String)session.getAttribute("attempt");
                      	 			if(attempt==null)
                      	 			{
                                          session.setAttribute("user", name);
                                          session.setAttribute("attempt", "1");
                                          RequestDispatcher rd=request.getRequestDispatcher("LoginUser.jsp");
                                          rd.forward(request, response);
                      	 			}
                      	 			else if(attempt.equals("1"))
                                       {
                      	 				int attemptInt=Integer.parseInt(attempt);
                                      	 session.setAttribute("attempt", (++attemptInt)+"");
                                           RequestDispatcher rd=request.getRequestDispatcher("LoginUser.jsp");
                                           rd.forward(request, response); 
                                      	 
                                      	 	
                                              
                                       }
                                       else
                                       {
                                      	 session.invalidate();
                                           LoginDao.loginLock(name);
                                           RequestDispatcher rd=request.getRequestDispatcher("AccountLocked.html");
                                           rd.forward(request, response);  
                                       }
                         
                          
                     }
                     else
                     {
                         session.setAttribute("user", name);
                         session.setAttribute("attempt", "1");
                         RequestDispatcher rd=request.getRequestDispatcher("LoginUser.jsp");
                         rd.forward(request, response); 
                    }
                   
                    
             }
            }
            else
            {
                   RequestDispatcher rd=request.getRequestDispatcher("AccountLocked.html");
                   rd.forward(request, response); 
             }
		}catch(ApplicationException ae) {
			log.error(ae);
			log.info(ae.getMessage());
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("ApplicationError.jsp");
			requestDispatcher.forward(request, response);
		}
		}
		
		if(request.getParameter("Add")!=null) {
			try {
			ProductPojo pojo = new ProductPojo();
			
			if(InputValidation.checkForDecimal(request.getParameter("rating")) && InputValidation.checkForDecimal(request.getParameter("price")) && InputValidation.checkForInteger(request.getParameter("buffer"))) {
				pojo.setProductName(request.getParameter("name"));
				pojo.setProductCategory(request.getParameter("category"));
				pojo.setProductBrand(request.getParameter("brand"));
				pojo.setProductDescription(request.getParameter("description"));
				pojo.setProductRating(request.getParameter("rating"));
				pojo.setProductPrice(request.getParameter("price"));
				pojo.setProductBuffer(request.getParameter("buffer"));
				
				int rowAffected = ProductDao.addProductDetails(pojo);
				
				ArrayList<ProductPojo> arrayList = ProductDao.fetchProductDetails();
				request.setAttribute("arrayList", arrayList);
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("FetchProduct.jsp");
				requestDispatcher.include(request, response);
			}
			
			else {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("AddProduct.jsp");
				request.setAttribute("msg", "Error, check for input !!");
				requestDispatcher.include(request, response);
			}
		}catch(ApplicationException ae) {
			log.error(ae);
			log.info(ae.getMessage());
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("ApplicationError.jsp");
			requestDispatcher.forward(request, response);
		}
		
		if(request.getParameter("AddProduct")!=null) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("AddProduct.jsp");
			requestDispatcher.forward(request, response);
			
		}
		
		if(request.getParameter("display")!=null) {
			try {
			ArrayList<ProductPojo> arrayList = ProductDao.fetchProductDetails();
			request.setAttribute("arrayList", arrayList);
			request.setAttribute("display", request.getParameter("display"));
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("FetchProduct.jsp");
			requestDispatcher.forward(request, response);
			}
			catch(ApplicationException ae) {
				log.error(ae);
				log.info(ae.getMessage());
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("ApplicationError.jsp");
				requestDispatcher.forward(request, response);
			}
		}
		
		if(request.getParameter("idManage")!=null) {
			request.setAttribute("id", request.getParameter("idManage"));
			request.setAttribute("buffer", request.getParameter("buffer"));
			request.setAttribute("stock", request.getParameter("stock"));
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("UpdateStock.jsp");
			requestDispatcher.include(request, response);
		}
		
		if(request.getParameter("Update")!=null) {
		try {
			if(InputValidation.checkForInteger(request.getParameter("stock"))) {
				ProductPojo pojo = new ProductPojo();
				
				pojo.setProductId(request.getParameter("idManaged"));
				pojo.setProductBuffer(request.getParameter("buffer"));
				pojo.setProductStock(request.getParameter("stock"));
				
				int rowAffected = ProductDao.updateStock(pojo);
				System.out.println(rowAffected);
				if(rowAffected!=0) {
					request.setAttribute("display", "inventory");
					ArrayList<ProductPojo> arrayList = ProductDao.fetchProductDetails();
					request.setAttribute("arrayList", arrayList);
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("FetchProduct.jsp");
					requestDispatcher.forward(request, response);
				}
			}
			else {
				request.setAttribute("id", request.getParameter("idManaged"));
				request.setAttribute("buffer", request.getParameter("buffer"));
				request.setAttribute("stock", request.getParameter("stock"));
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("UpdateStock.jsp");
				request.setAttribute("msg", "Error, check for input !!");
				requestDispatcher.include(request, response);
			}
			
		}
		catch (ApplicationException ae){
			log.error(ae);
			log.info(ae.getMessage());
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("ApplicationError.jsp");
			requestDispatcher.forward(request, response);
		}
		}
		
		if(request.getParameter("Logout")!=null) {
			HttpSession session = request.getSession(false);
			if (session != null) {
				session.invalidate();
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("LoginUser.html");
				requestDispatcher.forward(request, response);
			} else {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("LoginUser.html");
				requestDispatcher.forward(request, response);
			}
		}
		
		if(request.getParameter("id")!=null) {
			try {
			String id = request.getParameter("id");
			int check = ProductDao.removeProduct(Integer.parseInt(id));

			if (check != 0) {
				request.setAttribute("remove", "remove");
				ArrayList<ProductPojo> arrayList = ProductDao.fetchProductDetails();
				request.setAttribute("arrayList", arrayList);
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("FetchProduct.jsp");
				requestDispatcher.forward(request, response);

			}
			}catch(ApplicationException ae)
			{
				log.error(ae);
				log.info(ae.getMessage());
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("ApplicationError.jsp");
				requestDispatcher.forward(request, response);
				
			}
		}		
	}
	}}
