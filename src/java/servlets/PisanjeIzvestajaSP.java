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

public class PisanjeIzvestajaSP extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesija = request.getSession();
        //vrednosti za nalaze
        String idPacijenta = request.getParameter("idPacijenta");
        String datum = request.getParameter("datum");
        String disanje = request.getParameter("disanje");
        String puls = request.getParameter("puls");
        String temperatura = request.getParameter("temperatura");
        String pritisak = request.getParameter("pritisak");
        String mokraca = request.getParameter("mokraca");
        String stolica = request.getParameter("stolica");
        String krvnaSlika = request.getParameter("krvnaSlika");
        String specPregled = request.getParameter("specPregled");

        //vrednosti za Izvestaj
        String dijagnoza = request.getParameter("dijagnoza");
        String zakljucak = request.getParameter("zakljucak");
        String idNalaza = "";
        String updateNalaz = "INSERT INTO nalazi(id_pacijenta, datum,disanje,puls,temperatura,pritisak,mokraca,stolica,krvna_slika,specifican_pregled)"
                + "VALUES('" + idPacijenta + "','" + datum + "','" + disanje + "','" + puls + "','" + temperatura + "','" + pritisak + "','" + mokraca + "','" + stolica + "','" + krvnaSlika + "','" + specPregled + "')";

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            con = DB.getInstance().getConnection();
            stmt = con.createStatement();
            stmt.executeUpdate(updateNalaz);
            rs = stmt.executeQuery("SELECT * FROM nalazi ORDER BY id_nalaza DESC");
            if (rs.next()) {
                idNalaza = rs.getString("id_nalaza"); //izvlacenje poslednjeg nalaza
            }
            stmt.executeUpdate("INSERT INTO izvestaji_specijaliste(id_pacijenta,datum,id_nalaza,dijagnoza,zakljucak) VALUES('" + idPacijenta + "','" + datum + "','" + idNalaza + "','" + dijagnoza + "','" + zakljucak + "')");

        } catch (SQLException e) {

        } finally {
            DB.getInstance().putConnection(con);
        }
        sesija.setAttribute("idPacijenta", idPacijenta);
        request.setAttribute("idPacijenta", idPacijenta);
        request.setAttribute("poruka", "Uneli ste nove nalaze i napisali izvestaj");
        RequestDispatcher rd = request.getRequestDispatcher("OtvaranjePL.jsp");
        rd.forward(request, response);
    }
}
