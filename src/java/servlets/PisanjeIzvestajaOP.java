package servlets;
import Database.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PisanjeIzvestajaOP extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("idPacijenta");
        String dijagnoza = request.getParameter("dijagnoza");
        String bolest = request.getParameter("bolest");
        String tegoba = request.getParameter("tegoba");
        String terapija = request.getParameter("terapija");
        String datum = request.getParameter("datum");
        String napomena = request.getParameter("napomena");
        if(napomena == null){
            napomena = "";
        }
        
        String poruka = "";
        String upit = "INSERT INTO izvestaj_lekara(id_korisnika,dijagnoza,naziv_bolesti,tegoba,terapija,datum_kontrole,napomena) "
                + "VALUE('"+id+"','"+dijagnoza+"','"+bolest+"','"+tegoba+"','"+terapija+"','"+datum+"','"+napomena+"')";
        
        Connection con = null;
        Statement st = null;
        try{
            con = DB.getInstance().getConnection();
            st = con.createStatement();
            st.executeUpdate(upit);
            poruka = "Uspesno ste napisali izvestaj!";
            
        }catch(SQLException e){
            
        }
        request.setAttribute("poruka", poruka);
        RequestDispatcher rd = request.getRequestDispatcher("pisanjeIzvestajaOP.jsp");
        rd.forward(request, response);
        
    }

}
