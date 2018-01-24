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


public class IzmeniNalaz extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            String idNalaza = request.getParameter("idNalaza");
            String disanje = request.getParameter("disanje");
            String puls = request.getParameter("puls");
            String temperatura = request.getParameter("temperatura");
            String pritisak = request.getParameter("pritisak");
            String mokraca = request.getParameter("mokraca");
            String stolica = request.getParameter("stolica");
            String krvnaSlika = request.getParameter("krvnaSlika");
            String specificanPregled = request.getParameter("specPregled");
            Connection con = null;
                    Statement stmt = null;
            try{
                con = DB.getInstance().getConnection();
                 stmt = con.createStatement();
                String updateUpit = "UPDATE nalazi SET disanje='"+disanje+"', puls='"+puls+"',temperatura='"+temperatura+"',pritisak='"+pritisak+"',mokraca='"+mokraca+"',stolica='"+stolica+"',krvna_slika='"+krvnaSlika+"',specifican_pregled='"+specificanPregled+"' WHERE id_nalaza='"+idNalaza+"'";
                stmt.executeUpdate(updateUpit);
            }catch(SQLException e){
                
            }finally{
                DB.getInstance().putConnection(con);
            }
            request.setAttribute("poruka", "Uspesno ste izmenili karton");
            RequestDispatcher rd = request.getRequestDispatcher("PretragaPacijentaSP.jsp");
            rd.forward(request, response);
            
            
    }

   
}
