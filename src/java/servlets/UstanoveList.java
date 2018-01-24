package servlets;

import Database.DB;
import beans.Ustanova;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UstanoveList extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        List<Ustanova> ustanove = new ArrayList<Ustanova>();

        String adresa = "";
        String upit = "SELECT * FROM ustanove";
        
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        try{
             con = DB.getInstance().getConnection(); //otvaranje konekcija sa DB
            st = con.createStatement();
            rs = st.executeQuery(upit);
            
            while(rs.next()){
                Ustanova ustanova = new Ustanova();
                ustanova.setIdUstanove(rs.getString("id_ustanove"));
                ustanova.setNazivUstanove(rs.getString("naziv_ustanove"));
                ustanova.setAdresaUstanove(rs.getString("adresa"));
                ustanove.add(ustanova);
            }
            request.setAttribute("ustanove", ustanove);
            adresa = "dodajOdeljenje.jsp";
            st.close();
        }catch(SQLException greska)
        {
            request.setAttribute("porukaogresci", "Greska: " + greska);
            adresa = "greska.jsp";
        }finally{
            
            
        }
        RequestDispatcher rd = request.getRequestDispatcher(adresa);
             rd.forward(request, response);

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    processRequest(request, response);
    }
}
