package servlets;
import Database.DB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String ime = request.getParameter("ime");
        String prezime = request.getParameter("prezime");
        String pol = request.getParameter("pol");
        String username= request.getParameter("username");
        String password1= request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String jmbg = request.getParameter("jmbg");
        String adresaStanovanja = request.getParameter("adresa");
        String telefon = request.getParameter("telefon");
        String email = request.getParameter("email");
        
        //ova 2 podatka idu u tabelu za pacijente
        String nosilac = request.getParameter("nosilac");
        String srodstvo = request.getParameter("srodstvo");
        
        //upit za tabelu korisnici
        String upit = "INSERT INTO korisnici(ime, prezime, pol,korisnicko_ime, lozinka, jmbg, adresa, telefon, email, tip_korisnika)"
                + "VALUES('" + ime + "','" + prezime + "','" + pol + "','" + username + "','" + password1 + "','"
                + jmbg + "','" + adresaStanovanja + "','" + telefon + "','" + email + "','pacijent');";
        //upit za tabelu pacijenti
        String upit2 = "INSERT INTO pacijenti(nosilac,srodstvo) VALUES('" + nosilac + "','" + srodstvo + "');";
        String poruka = "";
        if (ime.isEmpty() || prezime.isEmpty() || username.isEmpty() || password1.isEmpty() || password2.isEmpty() || jmbg.isEmpty() || adresaStanovanja.isEmpty() || telefon.isEmpty() || email.isEmpty() || nosilac.isEmpty() || srodstvo.isEmpty()) {
            poruka = "Niste popunili sva polja";
            request.setAttribute("poruka", poruka);
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
            rd.forward(request, response);
        }
        if(!password1.equals(password2)){
            poruka = "Niste dobro uneli lozinku";
            request.setAttribute("poruka", poruka);
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
            rd.forward(request, response);
        }
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String adresa = "index.jsp";
        
        try {
            con = DB.getInstance().getConnection(); //otvaranje konekcija sa DB
            st = con.createStatement();
            st.executeUpdate(upit);
            String upitID = "SELECT * FROM korisnici WHERE korisnicko_ime='"+username+"'";
            rs = st.executeQuery(upitID);
            String id = null;
            if(rs.next()){
             id = rs.getString("id_korisnika");
            }
            String upit3 = "INSERT INTO pacijenti(id_korisnika,id_ustanove,nosilac,srodstvo) VALUES('"+id+"','1','"+nosilac+"','"+srodstvo+"')";
            st.executeUpdate(upit3);
            
            
            st.close();
            con.close(); //zatvaranje konekcije sa DB
        } catch (SQLException greska) {
            request.setAttribute("porukaogresci", "Greska: " + greska.getMessage());
            adresa = "greska.jsp";
        } finally {
            DB.getInstance().putConnection(con);
        }
        request.setAttribute("poruka", "Registrovali ste se!");
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }


}
