package servlets;

import Database.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PrihvatiKorisnika extends HttpServlet {

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("korisnikButton");
            String updateDB = "UPDATE korisnici SET odobren='1' WHERE korisnicko_ime='" + username + "'";

            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            try{
            con = DB.getInstance().getConnection();
            st=con.createStatement();
            st.executeUpdate(updateDB);
            
            st.close();
                con.close();
            }catch(SQLException greska){
            }finally{
                DB.getInstance().putConnection(con);
            }
            RequestDispatcher rd = request.getRequestDispatcher("prihvatiKorisnika.jsp");
        rd.forward(request, response);
    }

  

}
