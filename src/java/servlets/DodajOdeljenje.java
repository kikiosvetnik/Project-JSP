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


public class DodajOdeljenje extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idUstanove = request.getParameter("nazivUstanove");
        String nazivOdeljenja = request.getParameter("naziv");
        
        String poruka = "";
        
        String upit = "INSERT INTO odeljenja(id_ustanove,naziv_odeljenja,id_korisnika) VALUES('"+idUstanove+"','"+nazivOdeljenja+"','0')";
        
        if(nazivOdeljenja.isEmpty()){
         poruka = "Niste popunili sva polja";
            request.setAttribute("poruka", poruka);
            RequestDispatcher rd = request.getRequestDispatcher("dodajOdeljenje.jsp");
            rd.forward(request, response);
        }
        Connection con = null;
        Statement st = null;
        
        String adresa = "dodajOdeljenje.jsp";
        
        try {
            con = DB.getInstance().getConnection(); //otvaranje konekcija sa DB
            st = con.createStatement();
            st.executeUpdate(upit);
            st.close();
            con.close(); //zatvaranje konekcije sa DB
    }catch(SQLException greska){
        request.setAttribute("porukaogresci", "Greska: " + greska.getMessage());
            adresa = "greska.jsp";
    }finally{
        DB.getInstance().putConnection(con);
        }
        request.setAttribute("poruka", "Uspesno ste dodali odeljenje u ustanovu " +nazivOdeljenja+"!");
        RequestDispatcher rd = request.getRequestDispatcher("dodajOdeljenje.jsp");
        rd.forward(request, response);

    
    

}

}
