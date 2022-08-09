package com.group3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.db.DBConnection;

public class CheckOut extends HttpServlet {
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		//Statement st;
		out.println("This is the checkout servlet");
		try {
			
			DBConnection conn = new DBConnection();
			Statement st = conn.getConnection();
			Statement st2 = conn.getConnection();
			
		String t = request.getParameter("total");
		int total = Integer.parseInt(t);
		String cid = request.getParameter("customerID");
		int CustomerID = Integer.parseInt(cid);
		
		
		st.executeUpdate("update cart set total = (unitPrice * quantity) where customerID = "+CustomerID);
			
		//st2.executeUpdate("insert into sales (productLine, TotalAmount) values ("+CustomerID+", "+total+")");
		ResultSet lt = st.executeQuery("select sum(total) as t from cart where productLine = 'longTerm'");	
		
		
		//Long term
		int total_amount_l = 0;
		while(lt.next()) {
			total_amount_l = lt.getInt("t");
		}
		st.executeUpdate("update sales set TotalAmount = TotalAmount + "+total_amount_l+" where productLine = 'long term'");

		//Short term
		ResultSet sht = st.executeQuery("select sum(total) as t from cart where productLine = 'shortTerm'");
		int total_amount_s = 0;
		while(sht.next()) {
			total_amount_s = sht.getInt("t");
	
		}
		st.executeUpdate("update sales set TotalAmount = TotalAmount + "+total_amount_s+" where productLine = 'short term'");
		
		//medium term
		ResultSet mt = st.executeQuery("select sum(total) as t from cart where productLine = 'mediumTerm'");
		int total_amount_m = 0;
		while(mt.next()) {
			total_amount_m = mt.getInt("t");
		}
		st.executeUpdate("update sales set TotalAmount = TotalAmount + "+total_amount_m+" where productLine = 'medium term'");
		
	
		response.sendRedirect("cart.jsp?msg=succ");
		} catch (Exception e) {
			out.println("Error: " + e.getMessage());
	  }

	}
}
