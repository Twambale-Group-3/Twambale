<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import = "DB.DBconnection" %>
 <%@ page import = "java.sql.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee list</title>
</head>
<body style="background-color:lightblue">
<%
DBconnection con = new DBconnection();

Statement st = con.database();



%>
<h2 align = "Center"><font><Strong>HUMAN RESOURCE</Strong></font></h2><br>

<h2 align = "Center"><font><Strong>EMPLOYEE LIST</Strong></font></h2>

<table  class = table table-stripped" align = "Center" cellpadding = "5"  border= "1" >
<tr>
<td><b>EMPLOYEEID</b></td>
<td><b>FIRST NAME</b></td>
<td><b>LAST NAME</b></td>
<td><b>AGE</b></td>
<td><b>CONTACT</b></td>
<td><b>GENDER</b></td>
<td><b>ADDRESS</b></td>
</tr>

<% 
ResultSet result = st.executeQuery("Select* from Staff");

while(result.next()){
%>

<tr>

<td><%=result.getString(1) %></td>
<td><%=result.getString(2) %></td>
<td><%=result.getString(3) %></td>
<td><%=result.getString(4) %></td>
<td><%=result.getString(5) %></td>
<td><%=result.getString(6) %></td>
<td><%=result.getString(7) %></td>


</tr>


	
<% } %>
	</table>	
	<br><br>
	

	
	<form action ="Reallocate" method = "POST">
		<input type="submit" value="REALLLOCATE">
	</form>
		
	
	
</body>
</html>