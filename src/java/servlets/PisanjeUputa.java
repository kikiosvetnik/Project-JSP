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

public class PisanjeUputa extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idPacijenta = request.getParameter("idPacijenta");
        String idLekara = request.getParameter("idLekara");
        String datumPregleda = request.getParameter("datumPregleda");
        String idUstanove = "";
        String idOdeljenja = "";
        String upit1 = "SELECT * FROM lekari WHERE id_korisnika='" + idLekara + "'";
        try {
            Connection con = DB.getInstance().getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(upit1);
            if (rs.next()) {
                idUstanove = rs.getString("id_ustanove");
                idOdeljenja = rs.getString("id_odeljenja");
            }
            String upitUpdate = "INSERT INTO uputi_lekara(id_pacijenta,id_lekara,datum,id_odeljenja,id_ustanove)"
                    + "VALUES('" + idPacijenta + "','" + idLekara + "','" + datumPregleda + "','" + idOdeljenja + "','"+idUstanove + "')";
            stmt.executeUpdate(upitUpdate);
            
            request.setAttribute("poruka", "Uspesno ste napisali uput lekaru");
            RequestDispatcher rd = request.getRequestDispatcher("pisanjeUputa.jsp");
            rd.forward(request, response);
            
            stmt.close();
        } catch (SQLException e) {
            
        }

    }

}
