import java.io.IOException;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import DatabaseConnection.DatabaseConnection;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {
    public String adminemail = "admin@gmail.com";
    public String adminpassword = "123";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
      

        
        try {
                   //Getting all the parameters 
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            //Retriving our session
            HttpSession login = request.getSession();
            //Calling Connection method
            Connection con = DatabaseConnection.getConnection();
            //Creating Statement
            Statement st = con.createStatement();
            //Querying inside the database
            ResultSet resultset = st.executeQuery("select * from customerreg where Email='" + email + "' AND Password='" + password + "'");
            //If all the customer details are correct
            String cemail;
            String cpassword;
            
      
            
            //if manager details are correct
            if ((email.equals(adminemail)) && (password.equals(adminpassword))){
                
                login.setAttribute("email", adminemail);
                login.setAttribute("password",adminpassword);
                //JOptionPane.showMessageDialog(null, "You are logged in");
                response.sendRedirect("managerdash.jsp");
            } else {
                //if manager details are wrong
                //response.sendRedirect("login.jsp");
                
            }

            while (resultset.next()) {
                cemail = resultset.getString("email");
                cpassword = resultset.getString("password");
                //verifying details
                if((cemail.equals(email)) && (cpassword.equals(password))){
                login.setAttribute("id", resultset.getString("ID"));
                login.setAttribute("email", resultset.getString("email"));
                login.setAttribute("password", resultset.getString("password"));
               
                //Redirecting customer to dashboard page
                response.sendRedirect("customerdash.jsp");
                
                //popup alert
                //JOptionPane.showMessageDialog(null, "You are logging in!");
                }  
               else {
                //If customer details are wrong
                String message = "You have enter wrong credentials";
                login.setAttribute("credential", message);
                //Redirecting admin to login page
                response.sendRedirect("login.jsp");

            }
            
            
        } 
    } catch (IOException | SQLException e) {
            out.println("Error" + e.getMessage());
        }
} }