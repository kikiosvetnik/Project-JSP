package servlets;
import Database.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PromenaLozinke extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        
        String poruka = "";
        String adresa= "";
        //upit da li postoji username sa tim starim passwordom
        String upit = "SELECT lozinka FROM korisnici WHERE korisnicko_ime='"+username+"'";
        
        if(username.isEmpty() || oldPassword.isEmpty() || newPassword.isEmpty()){
            poruka = "Niste popunili sva polja";
            request.setAttribute("poruka", poruka);
            RequestDispatcher rd = request.getRequestDispatcher("promenaLozinka.jsp");
            rd.forward(request, response);
        }
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        
        try{
            con = DB.getInstance().getConnection();
            st=con.createStatement();
            rs = st.executeQuery(upit);
            String passwordDB = ""; //promenjiva gde se smesta password iz DB
            if(rs.next()){
                passwordDB = rs.getString("lozinka");
            }
            if(passwordDB.equals(oldPassword)){
                adresa = "index.jsp";
                poruka = "Uspesno ste promenili sifru";
                String upisDB = "UPDATE korisnici SET lozinka='"+newPassword+"' WHERE korisnicko_ime='"+username+"'";
                st.executeUpdate(upisDB);
                
                st.close();
                con.close();
            }
            else{
                adresa = "promenaLozinke.jsp";
                st.close();
                con.close();
                poruka = "Nepostoji korisnik sa izabranom starom sifrom";
                request.setAttribute("poruka", poruka);
            
            }
        } catch (SQLException ex) {
            
        }finally{
            DB.getInstance().putConnection(con);
        }
        request.setAttribute("poruka", poruka);
        RequestDispatcher rd = request.getRequestDispatcher(adresa);
        rd.forward(request, response);
        
    }

    
    

}
