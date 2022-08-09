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

String cid = (String) session.getAttribute("customerID");

//String customerID = session.getAttribute("cid").toString();
int customerID = Integer.parseInt(cid);
DBConnection conn = new DBConnection();
Statement st = conn.getConnection();

if(action.equals("del")){
	st.executeUpdate("delete from cart where no = '"+pdtID+"' and customerID = '"+customerID+"'");
	response.sendRedirect("cart.jsp?msg=remove");
}


%>


</body>
</html>