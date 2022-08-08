
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebServlet(name = "logout", urlPatterns = {"/logout"})
public class logout extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
            session.setAttribute("email", null);
            session.setAttribute("password", null);
            session.invalidate();
            
            response.sendRedirect("index.jsp");
            //popup alert
            //JOptionPane.showMessageDialog(null, "You are loggging out!");
    }



}
