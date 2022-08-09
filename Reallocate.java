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

import DB.DBconnection;


@SuppressWarnings("serial")
public class Reallocate extends HttpServlet {
	public final int allocationRatio = 7;
	public double shortTermStaff,mediumTermStaff,longTermStaff;
	int numberofstaff=0;
	double saleslt = 0;
	double salesmt = 0;
	double salesst = 0;
	double totalSales = 0;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		DBconnection con = new DBconnection();

		try {
			Statement st = con.database();
			
			

			ResultSet staffNumber = st.executeQuery("Select count(*) from staff ");
			while (staffNumber.next()) {
				numberofstaff=staffNumber.getInt(1);
			}
			
			out.println("Total Number of staff are: "+numberofstaff);
			shortTermStaff = (1*numberofstaff)/7;
			mediumTermStaff = (2*numberofstaff)/7;
			longTermStaff = (4*numberofstaff)/7;
			
			out.println("");
			
			//out.println("<tr>");
			//out.println("<td>"+(int)longTermStaff+"</td>");
			//out.println("</tr>");
			//out.println("</table>");
			
			out.println("There are "+(int)shortTermStaff+" short term productline employees");
			out.println("There are "+(int)mediumTermStaff+" medium term productline employees");
			out.println("There are "+(int)longTermStaff+" long term productline employees ");
			out.println("");
			out.println("");
			out.println("Allocated");
			
			
	
			//sales
			
			
			ResultSet longtsales = st.executeQuery("SELECT sales as slt FROM longtermsales");
			
			while(longtsales.next()) {
				saleslt += longtsales.getInt("slt");
			}
			out.println("Monthly Long Term Sales are: "+saleslt);
			
			
			ResultSet mediumtsales = st.executeQuery("SELECT sales as smt FROM mediumtermsales");
			
			while(mediumtsales.next()) {
				salesmt += mediumtsales.getInt("smt");
			}
			out.println("Monthly Medium Term Sales are: "+salesmt);
			
			
			ResultSet shorttsales = st.executeQuery("SELECT sales as sst FROM shorttermsales");
			
			while(shorttsales.next()) {
				salesst += shorttsales.getInt("sst");
			}
			
			out.println("Monthly Short Term Sales are: "+salesst);
			out.println("");
			out.println("");
			
			totalSales = salesmt+salesst+saleslt;
			
			out.println("Monthly Total Sales are: "+totalSales);
			
			shortTermStaff = Math.round((salesst*numberofstaff)/totalSales);
			mediumTermStaff = Math.round(((salesmt*numberofstaff)/totalSales));
			longTermStaff = numberofstaff - (shortTermStaff+mediumTermStaff);
			
			out.println("");
			out.println("");
			out.println("After Reallocation: ");
			out.println("short term staff are :"+(int)shortTermStaff);
			out.println("Long term staff are :"+(int)longTermStaff);
			out.println("medium term staff are :"+(int)mediumTermStaff);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		}
		
		
	}


