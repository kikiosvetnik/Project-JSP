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

public class DodajLekara extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String imeLekara = request.getParameter("imeLekara");
        String prezimeLekara = request.getParameter("prezimeLekara");
        String polLekara = request.getParameter("polLekara");
        String usernameLekara = request.getParameter("usernameLekara");
        String passwordLekara = request.getParameter("passwordLekara");
        String jmbgLekara = request.getParameter("jmbgLekara");
        String adresaLekara = request.getParameter("adresaLekara");
        String telefonLekara = request.getParameter("telefonLekara");
        String emailLekara = request.getParameter("emailLekara");
        String tipLekara = request.getParameter("tipLekara");
        String id_korisnika = "";
        
        //novo
        String ustanovaLekara = request.getParameter("ustanovaLekara");
        String odeljenjeLekara = request.getParameter("OdeljenjeLekara");
         
        String poruka ="";
        String upit = "INSERT INTO korisnici(ime,prezime,pol,korisnicko_ime,lozinka,jmbg,adresa,telefon,email,tip_korisnika,odobren) VALUES('"+imeLekara+"','"+prezimeLekara+"','"+polLekara+"','"+usernameLekara+"','"+passwordLekara+"','"+jmbgLekara+"','"+adresaLekara+"','"+telefonLekara+"','"+emailLekara+"','"+tipLekara+"','1')";
       
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        
        String adresa = "dodavanjeLekara.jsp";
        if(imeLekara.isEmpty() || prezimeLekara.isEmpty() || polLekara.isEmpty() || usernameLekara.isEmpty() || passwordLekara.isEmpty() || jmbgLekara.isEmpty() || adresaLekara.isEmpty() || telefonLekara.isEmpty() || telefonLekara.isEmpty() || tipLekara.isEmpty())
        {
        poruka = "Niste popunili sva polja";
            request.setAttribute("poruka", poruka);
            RequestDispatcher rd = request.getRequestDispatcher("dodavanjeLekara.jsp");
            rd.forward(request, response);
        }
        try{
            con = DB.getInstance().getConnection();
            st = con.createStatement();
            st.executeUpdate(upit);
             
            String upit2 ="SELECT id_korisnika FROM korisnici WHERE korisnicko_ime='"+usernameLekara+"'";
            rs = st.executeQuery(upit2);
            if(rs.next()){
            id_korisnika = rs.getString("id_korisnika");
            }
            String updateLekari ="INSERT INTO lekari(id_korisnika,id_odeljenja,id_ustanove) VALUES('"+id_korisnika+"','"+odeljenjeLekara+"','"+ustanovaLekara+"')";
            st.executeUpdate(updateLekari);
            st.close();
            rs.close();
            con.close();
        }catch(SQLException greska){
            request.setAttribute("porukaogresci", "Greska: " + greska.getMessage());
            adresa = "greska.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(adresa);
        rd.forward(request, response);
        }finally{
            DB.getInstance().putConnection(con);
            }
        request.setAttribute("poruka", "Uspesno ste dodali novog lekara!");
        RequestDispatcher rd = request.getRequestDispatcher("dodavanjeLekara.jsp");
        rd.forward(request, response);
    }

    
    

}
