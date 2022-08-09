<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "com.db.DBConnection" %>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String pdtID = request.getParameter("pid");
String action = request.getParameter("action");

//String customerID = session.getAttribute("cid").toString();
String id = session.getAttribute("customerID").toString();
int customerID = Integer.parseInt(id);
DBConnection conn = new DBConnection();
Statement st = conn.getConnection();

if(action.equals("inc")){
	st.executeUpdate("update cart set quantity = quantity + 1 where no = '"+pdtID+"' and customerID = '"+customerID+"'");
	response.sendRedirect("cart.jsp?msg=inc");
}
if(action.equals("dec")){
	st.executeUpdate("update cart set quantity = quantity - 1 where no = '"+pdtID+"' and customerID = '"+customerID+"'");
	response.sendRedirect("cart.jsp?msg=dec");
}



%>

</body>
</html>