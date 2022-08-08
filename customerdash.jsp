
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DatabaseConnection.DatabaseConnection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="assets/img/shopping-bag-icon.png">
        <title>Twambale Customer Page</title>
        <!-- fontawesome cdn -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
        <!-- custom css -->
        <link rel = "stylesheet" href = "assets/css/main.css">
        
        <!-- bootstrap CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    </head>
    
    <body>
        <!-- navbar -->
        <nav class = "navbar navbar-expand-lg navbar-light bg-white py-4 fixed-top">
            <div class = "container">
                <a class = "navbar-brand d-flex justify-content-between align-items-center order-lg-0" href = "customerdash.jsp">
                <img src = "assets/img/shopping-bag-icon.png" alt = "site icon">
                <span class = "text-uppercase fw-lighter ms-2">Twambale</span>
                </a>

                <div class = "order-lg-2 nav-btns">
                    <button type = "button" class = "btn position-relative">
                        <a href="cart.jsp"><i class = "fa fa-shopping-cart"></i></a>
                        
                    </button>
                    <button type = "button" class = "btn position-relative">
                        <a href="likes.jsp"> <i class = "fa fa-heart"></i></a>
                       
                    </button>  
                       
                    
                    <span style="padding-top:10px">Welcome
                        <%
                       
                        String email = (String)session.getAttribute("email");
                        Connection con = DatabaseConnection.getConnection();
                        //Creating Statement
                        Statement st = con.createStatement();
                        //Querying inside the database
                        ResultSet resultset = st.executeQuery("select Name from customerreg where Email='" + email + "'");
                        String name = null;
                        while(resultset.next()){
                            
                            name = (resultset.getString("Name"));
                            }
                        out.println(name);
                        %>
                    </span>
                    
                    <button type = "button" class = "btn position-relative" onclick="alert('You are logging out!');">
                        <a href="logout" ><img src = "assets/img/person-circle.svg" alt = "login/register icon"></a>
                        <span>Log out</span>
                    </button>
                    
                    
                </div>

                <button class = "navbar-toggler border-0" type = "button" data-bs-toggle = "collapse" data-bs-target = "#navMenu">
                <span class = "navbar-toggler-icon"></span>
            </button>

                <div class = "collapse navbar-collapse order-lg-1" id = "navMenu">
                    <ul class = "navbar-nav mx-auto text-center">
                        <li class = "nav-item px-2 py-2">
                            <a class = "nav-link text-uppercase text-dark" href = "customerdash.jsp">home</a>
                        </li>
                        <li class = "nav-item px-2 py-2">
                            <a class = "nav-link text-uppercase text-dark" href = "#sneakers">sneakers</a>
                        </li>
                        <li class = "nav-item px-2 py-2">
                            <a class = "nav-link text-uppercase text-dark" href = "#crocs">crocs</a>
                        </li>
                        <li class = "nav-item px-2 py-2">
                            <a class = "nav-link text-uppercase text-dark" href = "#heels">heels</a>
                        </li>
                        <li class = "nav-item px-2 py-2">
                            <a class = "nav-link text-uppercase text-dark" href = "sandals">sandals</a>
                        </li>
                        <li class = "nav-item px-2 py-2 border-0">
                            <a class = "nav-link text-uppercase text-dark" href = "#profile">profile</a>
                        </li>
                    </ul>
                </div>
        </div>
        </nav>
        <!-- end of navbar -->

        
    <!-- header -->
    <header id = "header" class = "vh-100 carousel slide" data-bs-ride = "carousel" style = "padding-top: 104px; background-image: url(assets/img/shoppingimg.jpg)">
        <div class = "container h-100 d-flex align-items-center carousel-inner">
            <div class = "text-center carousel-item active">
                <h2 class = "text-capitalize text-white">best collection</h2>
                <h1 class = "text-uppercase py-2 fw-bold text-white">new arrivals</h1>
                <a href = "#" class = "btn mt-3 text-uppercase">shop now</a>
            </div>
            <div class = "text-center carousel-item">
                <h2 class = "text-capitalize text-white">best price & offer</h2>
                <h1 class = "text-uppercase py-2 fw-bold text-white">new season</h1>
                <a href = "#" class = "btn mt-3 text-uppercase">buy now</a>
            </div>
        </div>

        <button class = "carousel-control-prev" type = "button" data-bs-target="#header" data-bs-slide = "prev">
            <span class = "carousel-control-prev-icon"></span>
        </button>
        <button class = "carousel-control-next" type = "button" data-bs-target="#header" data-bs-slide = "next">
            <span class = "carousel-control-next-icon"></span>
        </button>
    </header>
    <!-- end of header -->
        
        <!-- sneakers -->
        <section id = "sneakers" class = " py-5">
        <div class = "container">
            <div class = "title text-center py-5">
                <h2 class = "position-relative d-inline-block">Sneaker Collection</h2>
            </div>

            <div class = "special-list row g-0">
                <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                    <div class = "special-img position-relative overflow-hidden">
                        <img src = "assets/img/sneaker1.jpg" class = "w-100">
                        <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                    </div>
                    <div class = "text-center">
                        <p class = "text-capitalize mt-3 mb-1">Air Jordans</p>
                        <span class = "fw-bold d-block">$ 45.50</span>
                        <a href = "#" class = "btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>

                <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                    <div class = "special-img position-relative overflow-hidden">
                        <img src = "assets/img/sneaker2.jpg" class = "w-100">
                        <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                    </div>
                    <div class = "text-center">
                        <p class = "text-capitalize mt-3 mb-1">Nike Blazers </p>
                        <span class = "fw-bold d-block">$ 45.50</span>
                        <a href = "#" class = "btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>

                <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                    <div class = "special-img position-relative overflow-hidden">
                        <img src = "assets/img/sneaker3.jpg" class = "w-100">
                        <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                    </div>
                    <div class = "text-center">
                        <p class = "text-capitalize mt-3 mb-1">Adidas Original Men's trainers</p>
                        <span class = "fw-bold d-block">$ 45.50</span>
                        <a href = "#" class = "btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>

                <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                    <div class = "special-img position-relative overflow-hidden">
                        <img src = "assets/img/sneaker4.jpg" class = "w-100">
                        <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                    </div>
                    <div class = "text-center">
                        <p class = "text-capitalize mt-3 mb-1">Hayley-Davidson's Women Torland Canvas sneakers</p>
                        <span class = "fw-bold d-block">$ 45.50</span>
                        <a href = "#" class = "btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
        <!-- end of sneakers -->
    
        <!-- crocs -->
        <section id = "crocs" class = "py-5">
        <div class = "container">
            <div class = "title text-center py-5">
                <h2 class = "position-relative d-inline-block">Crocs Collection</h2>
            </div>

            <div class = "special-list row g-0">
                <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                    <div class = "special-img position-relative overflow-hidden">
                        <img src = "assets/img/sneaker1.jpg" class = "w-100">
                        <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                    </div>
                    <div class = "text-center">
                        <p class = "text-capitalize mt-3 mb-1">Air Jordans</p>
                        <span class = "fw-bold d-block">$ 45.50</span>
                        <a href = "#" class = "btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>

                <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                    <div class = "special-img position-relative overflow-hidden">
                        <img src = "assets/img/sneaker2.jpg" class = "w-100">
                        <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                    </div>
                    <div class = "text-center">
                        <p class = "text-capitalize mt-3 mb-1">Nike Blazers </p>
                        <span class = "fw-bold d-block">$ 45.50</span>
                        <a href = "#" class = "btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>

                <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                    <div class = "special-img position-relative overflow-hidden">
                        <img src = "assets/img/sneaker3.jpg" class = "w-100">
                        <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                    </div>
                    <div class = "text-center">
                        <p class = "text-capitalize mt-3 mb-1">Adidas Original Men's trainers</p>
                        <span class = "fw-bold d-block">$ 45.50</span>
                        <a href = "#" class = "btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>

                <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                    <div class = "special-img position-relative overflow-hidden">
                        <img src = "assets/img/sneaker4.jpg" class = "w-100">
                        <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                    </div>
                    <div class = "text-center">
                        <p class = "text-capitalize mt-3 mb-1">Hayley-Davidson's Women Torland Canvas sneakers</p>
                        <span class = "fw-bold d-block">$ 45.50</span>
                        <a href = "#" class = "btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
        <!-- crocs -->
    
        <!-- heels -->
        <section id ="heels" class = "py-5">
        <div class = "container">
            <div class = "title text-center py-5">
                <h2 class = "position-relative d-inline-block">Heels Collection</h2>
            </div>

            <div class = "special-list row g-0">
                <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                    <div class = "special-img position-relative overflow-hidden">
                        <img src = "assets/img/sneaker1.jpg" class = "w-100">
                        <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                    </div>
                    <div class = "text-center">
                        <p class = "text-capitalize mt-3 mb-1">Air Jordans</p>
                        <span class = "fw-bold d-block">$ 45.50</span>
                        <a href = "#" class = "btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>

                <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                    <div class = "special-img position-relative overflow-hidden">
                        <img src = "assets/img/sneaker2.jpg" class = "w-100">
                        <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                    </div>
                    <div class = "text-center">
                        <p class = "text-capitalize mt-3 mb-1">Nike Blazers </p>
                        <span class = "fw-bold d-block">$ 45.50</span>
                        <a href = "#" class = "btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>

                <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                    <div class = "special-img position-relative overflow-hidden">
                        <img src = "assets/img/sneaker3.jpg" class = "w-100">
                        <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                    </div>
                    <div class = "text-center">
                        <p class = "text-capitalize mt-3 mb-1">Adidas Original Men's trainers</p>
                        <span class = "fw-bold d-block">$ 45.50</span>
                        <a href = "#" class = "btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>

                <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                    <div class = "special-img position-relative overflow-hidden">
                        <img src = "assets/img/sneaker4.jpg" class = "w-100">
                        <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                    </div>
                    <div class = "text-center">
                        <p class = "text-capitalize mt-3 mb-1">Hayley-Davidson's Women Torland Canvas sneakers</p>
                        <span class = "fw-bold d-block">$ 45.50</span>
                        <a href = "#" class = "btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
        <!-- end of heels -->
    
        <!-- sandals -->
        <section id = "sandals" class = "py-5">
        <div class = "container">
            <div class = "title text-center py-5">
                <h2 class = "position-relative d-inline-block">Sandals Collection</h2>
            </div>

            <div class = "special-list row g-0">
                <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                    <div class = "special-img position-relative overflow-hidden">
                        <img src = "assets/img/sneaker1.jpg" class = "w-100">
                        <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                    </div>
                    <div class = "text-center">
                        <p class = "text-capitalize mt-3 mb-1">Air Jordans</p>
                        <span class = "fw-bold d-block">$ 45.50</span>
                        <a href = "#" class = "btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>

                <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                    <div class = "special-img position-relative overflow-hidden">
                        <img src = "assets/img/sneaker2.jpg" class = "w-100">
                        <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                    </div>
                    <div class = "text-center">
                        <p class = "text-capitalize mt-3 mb-1">Nike Blazers </p>
                        <span class = "fw-bold d-block">$ 45.50</span>
                        <a href = "#" class = "btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>

                <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                    <div class = "special-img position-relative overflow-hidden">
                        <img src = "assets/img/sneaker3.jpg" class = "w-100">
                        <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                    </div>
                    <div class = "text-center">
                        <p class = "text-capitalize mt-3 mb-1">Adidas Original Men's trainers</p>
                        <span class = "fw-bold d-block">$ 45.50</span>
                        <a href = "#" class = "btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>

                <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                    <div class = "special-img position-relative overflow-hidden">
                        <img src = "assets/img/sneaker4.jpg" class = "w-100">
                        <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                    </div>
                    <div class = "text-center">
                        <p class = "text-capitalize mt-3 mb-1">Hayley-Davidson's Women Torland Canvas sneakers</p>
                        <span class = "fw-bold d-block">$ 45.50</span>
                        <a href = "#" class = "btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
        </section>
        <!-- end of sandals -->
    
        <!--profile-->
        <section id="profile" class="py-5">
            <div class="container-fluid px-2 px-md-4">
                <div class="page-header min-height-300 border-radius-xl mt-4" style="background-image: url('https://images.unsplash.com/photo-1531512073830-ba890ca4eba2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');">
                    <span class="mask  bg-gradient-primary  opacity-6"></span>
                </div>
                <div class="card card-body mx-3 mx-md-4 mt-n6">

                    <div class="row">
                        <div class="row">
                            <div class="col-12 col-xl-4">
                                <div class="card card-plain h-100">
                                    <div class="card-header pb-0 p-3">
                                        <div class="row">
                                            <div class="col-md-8 d-flex align-items-center">
                                                <h6 class="mb-0">Profile Information</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body p-3">
                                       
                                        <ul class="list-group">
                                            
                                          <li class="list-group-item border-0 ps-0 pt-0 text-sm"><strong class="text-dark">Full Name:</strong> &nbsp; 
                                              <% 
                                                String email1 = (String)session.getAttribute("email");
                                                Connection con1 = DatabaseConnection.getConnection();
                                                //Creating statement
                                                Statement st1 = con1.createStatement();
                                                //Querying database
                                                ResultSet resultset1 = st1.executeQuery("select Name from customerreg where Email='" + email1 + "'");
                                                String name1 = null;
                                                while(resultset1.next()){
                                                  name1 = (resultset1.getString("Name"));
                                                  
                                                  }
                                                out.println(name1);
                                              %>
                                          </li>
                                        
                                         
                                          <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">Mobile:</strong> &nbsp; (+256)
                                                                                            <% 
                                                String email2 = (String)session.getAttribute("email");
                                                Connection con2 = DatabaseConnection.getConnection();
                                                //Creating statement
                                                Statement st2 = con2.createStatement();
                                                //Querying database
                                                ResultSet resultset2 = st2.executeQuery("select Phone from customerreg where Email='" + email2 + "'");
                                                String phone = null;
                                                while(resultset2.next()){
                                                  phone = (resultset2.getString("Phone"));
                                                  
                                                  }
                                                out.println(phone);
                                              %>
                                          </li>
                                        
                                         
                                          <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">Email:</strong> &nbsp;
                                               <% 
                                                String email3 = (String)session.getAttribute("email");
                                                out.println(email3);
                                                
                                              %>
                                          </li>
                                        
                                        <tr>
                                          <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">Location:</strong> &nbsp;
                                             <% 
                                                String email4 = (String)session.getAttribute("email");
                                                
                                                Connection con4 = DatabaseConnection.getConnection();
                                                //Creating statement
                                                Statement st4 = con4.createStatement();
                                                //Querying database
                                                ResultSet resultset4 = st4.executeQuery("select Address from customerreg where Email='" + email4 + "'");
                                                String address = null;
                                                while(resultset4.next()){
                                                  address = (resultset4.getString("Address"));
                                                  
                                                  }
                                                out.println(address);
                                              %>
                                          </li> 
                                        
                                        <tr>
                                          <li class="list-group-item border-0 ps-0 pt-0 text-sm"><strong class="text-dark">Gender:</strong> &nbsp;
                                              <% 
                                                String email5 = (String)session.getAttribute("email");
                                                Connection con5 = DatabaseConnection.getConnection();
                                                //Creating statement
                                                Statement st5 = con5.createStatement();
                                                //Querying database
                                                ResultSet resultset5 = st5.executeQuery("select Gender from customerreg where Email='" + email5 + "'");
                                                String gender = null;
                                                while(resultset5.next()){
                                                  gender = (resultset5.getString("Gender"));
                                                  
                                                  }
                                                out.println(gender);
                                              %>
                                          </li>
                                        
                                        <tr>
                                          <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">Password:</strong> &nbsp;
                                              <% 
                                                String email6 = (String)session.getAttribute("email");
                                                Connection con6 = DatabaseConnection.getConnection();
                                                //Creating statement
                                                Statement st6 = con6.createStatement();
                                                //Querying database
                                                ResultSet resultset6 = st6.executeQuery("select Password from customerreg where Email='" + email6 + "'");
                                                String password = null;
                                                while(resultset6.next()){
                                                  password = (resultset6.getString("Password"));
                                                  
                                                  }
                                                out.println(password);
                                              %>
                                          </li>

                                        </ul>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            
                             <%@include file="updateprofile.jsp" %>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- jquery -->
        <script src = "assets/js/jquery-3.6.0.js"></script>
        <!-- isotope js -->
        <script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.js"></script>
        
        <!-- custom js -->
        <script src = "assets/js/script.js"></script>
        
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    </body>
    
</html>


