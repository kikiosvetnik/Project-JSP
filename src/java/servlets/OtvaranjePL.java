package servlets;

import Database.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OtvaranjePL extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesija = request.getSession();
        String idPacijenta = (String)sesija.getAttribute("idPacijenta");
        String idLekara = (String)sesija.getAttribute("id");
        
        //ove podatke izvlacim iz baze
        String idUstanove = "";
        String idOdeljenja = "";
        String imeLekara = "";
        
        String bolest = request.getParameter("bolest");
        String tegoba = request.getParameter("tegoba");
        String stanje = request.getParameter("stanje");
        String upit1 = "SELECT * FROM lekari WHERE id_korisnika='"+idLekara+"'";
        String upit2 = "SELECT * FROM korisnici WHERE id_korisnika='"+idLekara+"'";
        
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            con = DB.getInstance().getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery(upit1);
            if(rs.next()){
                idUstanove = rs.getString("id_ustanove");
                idOdeljenja = rs.getString("id_odeljenja");
            }
            rs = stmt.executeQuery(upit2);
            if(rs.next()){
                imeLekara = rs.getString("ime") + " " + rs.getString("prezime");
            }
            String updateUpit = "INSERT INTO prijemni_list(id_pacijenta,id_odeljenja,id_ustanove,bolest,tegoba,ime_lekara,stanje) "
                    + "VALUES('"+idPacijenta+"','"+idOdeljenja+"','"+idUstanove+"','"+bolest+"','"+tegoba+"','"+imeLekara+"','"+stanje+"')";
            stmt.executeUpdate(updateUpit);
        }catch(SQLException e){
            
        }finally{
            DB.getInstance().putConnection(con);
        }
        request.setAttribute("poruka", "Uspesno ste primili pacijenta na vase odeljenje.");
        RequestDispatcher rd = request.getRequestDispatcher("pisanjeIzvestajaSP.jsp");
        rd.forward(request, response);
        
    }

}
