package com.group3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.sql.*;

import com.db.DBConnection;
import com.mysql.cj.Session;

public class AddToCart extends HttpServlet {
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		//Database connection object
		DBConnection conn = new DBConnection();
		
		//Getting the details of a product that is going to be added to the cart table
		String notloggedin = request.getParameter("log");
		String productID = request.getParameter("productID");
		
		String like = request.getParameter("like");
		String addToCart = request.getParameter("addToCart");
		
		//Getting other variables belonging to a product
		String productName = request.getParameter("productName");
		String unitPrice = request.getParameter("unitPrice");
		String productLine = request.getParameter("productLine");
		String imageName = request.getParameter("imageName");
		String quantity = request.getParameter("quantity");
		
		//Enabling the customer like a product even when they havn't logged in yet
		if(notloggedin != null) {
			
			//if like button was clicked on the index page
			//if(!like.isEmpty()) {
			if(like != null) {	
				try {
					Statement st2 = conn.getConnection();
					st2.executeUpdate("update product set likes = likes + 1 where id = "+productID);
					response.sendRedirect("index.jsp");
			     } catch (Exception a) {out.println("Error: "+a.getMessage());}
			
				
			}
			
			//if the add to cart button was clicked on the index page
			//if(!addToCart.isEmpty()) {
			//HttpSession session = request.getSession();
			if(addToCart != null) {
				HttpSession session = request.getSession();
				//session.setAttribute("pid", productID);
				session.setAttribute("ids", productID);
				//response.sendRedirect("login.jsp?pid="+productID);
				response.sendRedirect("login.jsp?pid="+productID);
			}
			
		}else {
			
			if(addToCart != null) {
				HttpSession sess = request.getSession();
				String customerID = (String) sess.getAttribute("customerID");
				try {
					Statement st2 = conn.getConnection();
					st2.executeUpdate("insert into cart (customerId, productName, unitPrice, productLine, imageName,quantity) values ("+customerID+", '"+productName+"', " + unitPrice + ",'"+productLine+"', '"+imageName+"','"+quantity+"')");
					response.sendRedirect("cart.jsp");
				}catch (Exception e) {
					out.println("Error: " + e.getMessage());
				}
			}
			
		}
		
		
		//Accessing the CustomerID and the product ID from the session
		HttpSession ses = request.getSession();
		if(!ses.isNew()) {
			String prdtID = (String)ses.getAttribute("pidfromform");
			
				if(prdtID != null) {
					
				}
		
		}
		
		
		//String like = request.getParameter("like");
		//String addToCart = request.getParameter("addToCart");
		//String productName = request.getParameter("productName");
		//String unitPrice = request.getParameter("unitPrice");
//		String productLine = request.getParameter("productLine");
//		String imageName = request.getParameter("imageName");
//		String quantity = request.getParameter("quantity");
		//String productID = request.getParameter("productID");
		
		//HttpSession session = request.getSession();
		//String cid = session.getAttribute("id").toString();
		//String cid = 
		/*
		 * 
		 * General thing which was working
		 * 
		 * 	//checking if at all the customer isn't logged in yet
		//if(cid == null) {
		if(cid == null && notloggedin != null ){
			//If at all they pressed like, then the product's likes increase
			if(like != null) {
				try {
					Statement st = conn.getConnection();
					st.executeUpdate("update product set likes = likes + 1 where id = "+productID);
					response.sendRedirect("index.jsp");
				} catch (Exception e) {out.println("Error: "+e.getMessage());} 
			}
		}//end of if
		
		*/
		
		
		//WORKS VERY WELL 
		/*
		HttpSession ses = request.getSession();
		String cid = ses.getAttribute("ids").toString();
		if(!cid.equals("") && addToCart!=null) {
			
			int customerID = Integer.parseInt(cid);
			//if at all they pressed add to cart, product is added to the cart
			
					try {
					Statement st2 = conn.getConnection();
					st2.executeUpdate("insert into cart (customerId, productName, unitPrice, productLine, imageName,quantity) values ("+customerID+", '"+productName+"', " + unitPrice + ",'"+productLine+"', '"+imageName+"','"+quantity+"')");
					response.sendRedirect("cart.jsp");
				} catch (Exception e) {
				out.println("Error: "+e.getMessage());
			}
		}// end of if for adding to cart when logged in   */
		
	}
			
		//Getting the ID from the session attribute
		//HttpSession session = request.getSession();
		//String cid = (String) session.getAttribute("id");
		
	
		/*
		if(cid != null && like!=null) {
			//int custID = Integer.parseInt(cid);	
				try {
					Statement st = conn.getConnection();
					st.executeUpdate("update product set likes = likes + 1 where id = "+productID);
					response.sendRedirect("index.jsp");
					} catch (Exception e) {out.println("Error: "+e.getMessage());} 
		}// end of if for liking when logged in already
		*/
		
		
		
		
		
			//}
			
		//}
		
	
	
	//If at all they already lgged in
		/*
			if(cid != null) {
				int customerID = Integer.parseInt(cid);
				//if at all they pressed add to cart, product is added to the cart
				if(addToCart != null) {
					try {
						Statement st2 = conn.getConnection();
						st2.executeUpdate("insert into cart (customerId, productName, unitPrice, productLine, imageName,quantity) values ("+customerID+", '"+productName+"', " + unitPrice + ",'"+productLine+"', '"+imageName+"','"+quantity+"')");
						response.sendRedirect("cart.jsp");
				} catch (Exception e) {
					out.println("Error: "+e.getMessage());
				}
				
			}
		}
			*/
			/*
		//If at all they logged in already and still clicked the like button		
			if(cid != null && like.equals("LIKES")) {
					
					try {
						Statement st = conn.getConnection();
						st.executeUpdate("update product set likes = likes + 1 where id = "+productID);
						response.sendRedirect("customerdash.jsp");
					} catch (Exception e) { out.println("Error: "+e.getMessage());} 
				}
	
		*/
	} //close of the service method
	
//}//close of the servlet
