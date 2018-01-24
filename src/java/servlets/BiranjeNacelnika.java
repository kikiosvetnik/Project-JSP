package servlets;

import Database.DB;
import java.io.IOException;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BiranjeNacelnika extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id_Korisnika = request.getParameter("idKorisnika");
        String id_Odeljenja = request.getParameter("idOdeljenja");
        String upit = "UPDATE odeljenja SET id_korisnika='" + id_Korisnika + "' WHERE id_odeljenja='"+id_Odeljenja+"'";
        String poruka = "";
        Connection con = null;
        Statement st = null;

        try {
            con = DB.getInstance().getConnection();
            st=con.createStatement();
            st.executeUpdate(upit);
            poruka = "Uspesno ste postavili nacelnika";
            st.close();
            con.close();
            request.setAttribute("poruka", poruka);
            RequestDispatcher rd = request.getRequestDispatcher("biranjeNacelnika.jsp");
            rd.forward(request, response);
            
        } catch (SQLException e) {
            poruka = "Greska koja se dogodila je" + e;
            request.setAttribute("poruka", poruka);
            RequestDispatcher rd = request.getRequestDispatcher("greska.jsp");
            rd.forward(request, response);
        }

    }

}
