package servlets;

import Database.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OdbiKorisnika extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idKorisnika = request.getParameter("korisnikButton");
        Connection con = null;
        Statement stmt = null;
        String upit1 = "DELETE FROM korisnici WHERE id_korisnika='"+idKorisnika+"'";
        String upit2 = "DELETE FROM pacijenti WHERE id_korisnika='"+idKorisnika+"'";
        try{
            con = DB.getInstance().getConnection();
            stmt = con.createStatement();
            stmt.executeUpdate(upit1);
            stmt.executeUpdate(upit2);
        }catch(SQLException e){
            request.setAttribute("poruka", "Doslo je do sql greske");
            RequestDispatcher rd = request.getRequestDispatcher("prihvatiKorisnika.jsp");
            rd.forward(request, response);
        }finally{
                DB.getInstance().putConnection(con);
            }
            RequestDispatcher rd = request.getRequestDispatcher("prihvatiKorisnika.jsp");
            rd.forward(request, response);
        
    }

   
 

}
