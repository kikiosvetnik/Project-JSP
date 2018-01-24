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

public class DodajUstanovu extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String naziv = request.getParameter("naziv");
        String adresaUstanove = request.getParameter("adresaUstanove");

        String poruka = "";

        String upit = "INSERT INTO ustanove(naziv_ustanove, adresa) VALUES('" + naziv + "','" + adresaUstanove + "')";

        if (naziv.isEmpty() || adresaUstanove.isEmpty()) {
            poruka = "Niste popunili sva polja";
            request.setAttribute("poruka", poruka);
            RequestDispatcher rd = request.getRequestDispatcher("dodavanjeUstanove.jsp");
            rd.forward(request, response);
        }
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String adresa = "dodavanjeUstanove.jsp";

        try {
            con = DB.getInstance().getConnection(); //otvaranje konekcija sa DB
            st = con.createStatement();
            st.executeUpdate(upit);
            st.close();
            con.close(); //zatvaranje konekcije sa DB
        } catch (SQLException greska) {
            request.setAttribute("porukaogresci", "Greska: " + greska.getMessage());
            adresa = "greska.jsp";
        } finally {
            DB.getInstance().putConnection(con);
        }
        request.setAttribute("poruka", "Uspesno ste dodali ustanovu!");
        RequestDispatcher rd = request.getRequestDispatcher("dodavanjeUstanova.jsp");
        rd.forward(request, response);

    }

}
