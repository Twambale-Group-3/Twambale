<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<%@page import = "com.db.DBConnection" %>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="assets/img/shopping-bag-icon.png">
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->
  <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
  <link id="pagestyle" href="assets/css/material-dashboard.css?v=3.0.4" rel="stylesheet" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<title>Customer Cart</title>




<style>
.scroll{
width: 100%;
padding: 10px;
display: flex;
justify-content: space-around;
align-items: center;
flex-wrap: wrap;
}

a{
text-decoration: none;
}

</style>

</head>
<body>
  <%@include file="customernav.jsp" %>
  
  <%
  String message = "";
  
  String word = request.getParameter("msg");
  
  if(word != null){
	  if(word.equals("inc") && word != null){
		  message = "Item quantity successfully incremented...";
	  }
	  if(word.equals("dec") && word != null){
		  message = "Reduction of item quantity successful...";
	  }
	  if(word.equals("remove") && word != null){
		  message = "Item has successfully been removed from the cart...";
	  }
	  if(word.equals("succ") && word != null){
		  message = "Thank you for placing your order..."; 
	  }
  }
  %>

<table class="table table-striped" style = "width:80%; margin-left: 100px;">
	<p class = "flex p-3 bg-dark text-light text-center" style = " width:80%; margin-top: 149px; margin-left: 100px;background-color: gray; "><%= message %></p>
 	<tr>
      <th scope="col">No.</th>
      <th scope="col">Image</th>
      <th scope="col">Product Name</th>
      <th scope="col">Unit Price (UGX)</th>
      <th scope="col">Quantity</th>
      <th scope="col">Total (UGX)</th>
      <th scope="col">Action</th>
    </tr>
    
    
    <% 
    	 int counter = 0;
   		 int sub_total = 0;
   		 int total = 0;
		DBConnection conn = new DBConnection();
		Statement st = conn.getConnection();
		
		String id = session.getAttribute("customerID").toString();
		int customerID =  Integer.parseInt(id);
	
		ResultSet cart = st.executeQuery("select * from cart where customerID ="+customerID);
		
		while(cart.next()){
			counter = counter + 1;
			sub_total = cart.getInt("unitPrice") * cart.getInt("quantity");
			
			total = total + sub_total;
	%>
    <tr>
      <td><% out.println(counter); %></td>
      <td><img src = "images/<%= cart.getString("imageName") %>" height= 50px; width=50px; ></td>
      <td><%= cart.getString("productName") %></td>
      <td>    <%= cart.getInt("unitPrice") %></td>
      <td><a href = "incDec.jsp?pid=<%= cart.getString("no")%>&action=dec"><i class="bi bi-dash-circle"></i></a> <%= cart.getString("quantity") %> <a href = "incDec.jsp?pid=<%= cart.getString("no")%>&action=inc"><i class="bi bi-plus-circle"></i></a></td>
      <td><%= sub_total %></td>
      <td><a href = "removefromcart.jsp?pid=<%= cart.getString("no")%>&action=del"> <i class="bi bi-trash"></i>Remove</a></td>
    </tr>
    
    <% } %>
    
    

</table>
<form action = "CheckOut?total=<%=total %>&customerID=<%=id %>" method = "post">
	<div class = "d-flex justify-content-center align-self-center">
	
		<h4 style = "margin: 20px 20px 0px 0px">Total amount to pay: UGX <%= total %> </h4>
		<!--  <a href = "checkout.jsp"><button class = "btn btn-primary mt-3" type = "submit" name = "checkout">CkeckOut</button></a> -->
		<button class = "btn btn-primary mt-3" type = "submit" name = "checkout">CkeckOut</button>

	</div>
</form>



<!-- </div>  -->

	
	
</body>
</html>