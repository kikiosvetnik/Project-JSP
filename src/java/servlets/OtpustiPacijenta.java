package servlets;

import Database.DB;
import java.io.IOException;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class OtpustiPacijenta extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            int idLista= Integer.parseInt(request.getParameter("idLista"));
            Connection con = null;
            Statement stmt = null;
            try{
                con = DB.getInstance().getConnection();
                stmt = con.createStatement();
                java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
                stmt.executeUpdate("UPDATE prijemni_list SET datum_odpustanja='"+date+"' WHERE id_lista='"+idLista+"'");
                
            }catch(SQLException e){
                 request.setAttribute("poruka", "Doslo je do greske" +e);
            RequestDispatcher rd = request.getRequestDispatcher("NacelnikKartoni.jsp");
            rd.forward(request, response);
                
            }finally{
                DB.getInstance().putConnection(con);
            }
            request.setAttribute("poruka", "Odpustili ste pacijenta");
            RequestDispatcher rd = request.getRequestDispatcher("NacelnikKartoni.jsp");
            rd.forward(request, response);
    }

    

 

}
