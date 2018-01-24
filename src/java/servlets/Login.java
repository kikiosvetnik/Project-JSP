package servlets;
import Database.DB;
import beans.Korisnik;
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
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //preuzimanje parametara sa forme za login i kreiranje objekta Korisnika 
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Korisnik kor = new Korisnik();
        kor.setUsername(username);
        kor.setPassword(password);
        HttpSession sesija = request.getSession();
        sesija.setAttribute("korisnik", kor);
        
        String poruka = null;
        //**********************************************************************
        //provera da li su uneta oba polja za login i redirektovanje na pocetnu stranicu ako nisu
        if(username.isEmpty() || password.isEmpty()){
            poruka = "Niste popunili sva polja!";
            request.setAttribute("poruka", poruka);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
      
        //**************************************************************************************
        Connection con = null;
        Statement st = null;
        ResultSet rs = null; //result set za smestanje podataka iz baze 
        String adresa = "pocetna.jsp";
        
        try{
            con = DB.getInstance().getConnection();
            st = con.createStatement();
            String upit = "SELECT * FROM korisnici WHERE korisnicko_ime='"+username+"' AND lozinka='"+password+"' AND odobren=1 ";
            rs = st.executeQuery(upit);
            if(rs.next()){
                String id = rs.getString("id_korisnika");
                String ime = rs.getString("ime");
                String prezime = rs.getString("prezime");
                String pol = rs.getString("pol");
                String jmbg = rs.getString("jmbg");
                String adresaStanovanja = rs.getString("adresa");
                String telefon = rs.getString("telefon");
                String email = rs.getString("email");
                String tip_korisnika = rs.getString("tip_korisnika");
                
                kor.setIdKorisnika(id);
                kor.setIme(ime);
                kor.setPrezime(prezime);
                kor.setPol(pol);
                kor.setJmbg(jmbg);
                kor.setAdresa(adresaStanovanja);
                kor.setTelefon(telefon);
                kor.setEmail(email);
                kor.setTipKorisnika(tip_korisnika);
                sesija.setAttribute("id", id);
                request.setAttribute("id",id);
            }
            else{
                poruka = "Neispravno korisnicko ime ili lozinka. Pokusajte ponovo.";
                request.setAttribute("poruka", poruka);
                kor.setPassword("");
                adresa = "index.jsp";
                st.close();
                RequestDispatcher rd = request.getRequestDispatcher(adresa);
                rd.forward(request, response);
            }
            
             //Provera koji je tip korisnika i postavljanje adrese na koju ce kasnije biti redirectovan
            if(kor.getTipKorisnika().equals("admin")) adresa ="adminIndex.jsp";
            else if(kor.getTipKorisnika().equals("pacijent")) adresa = "pacijentIndex.jsp";
            else if(kor.getTipKorisnika().equals("lekar")) adresa = "lekarIndex.jsp";
            else if(kor.getTipKorisnika().equals("specijalista")) adresa = "specIndex.jsp";
            st.close();
            
           
            
        }catch(SQLException greska){
            sesija.invalidate();
            request.setAttribute("porukaogresci", "Greska: " + greska);
            adresa = "greska.jsp";
        }finally{
                    DB.getInstance().putConnection(con);
                   }
             
             RequestDispatcher rd = request.getRequestDispatcher(adresa);
             rd.forward(request, response);
        
        
        
    }
}
