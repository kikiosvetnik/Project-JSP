<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="Database.DB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pregled lekara</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
        <%
            HttpSession sesija = request.getSession();
            String idLekara = (String) sesija.getAttribute("id");
        %>
    </head>
    <body>



        <div class="container">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavBar" >
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Zdravstvena ustanova</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="mainNavBar">
                        <ul class="nav navbar-nav ">
                            <li><a href="specIndex.jsp">Pocetna</a></li>
                            <li><a href="pisanjeIzvestajaSP.jsp">Pisanje izvestaja</a></li>
                            <li><a href="PretragaPacijentaSP.jsp">Pretraga Pacijenata</a></li>
                                <%
                                    String odeljenjeNacelnika = "";
                                    Connection con = DB.getInstance().getConnection();
                                    Statement stmt = con.createStatement();
                                    ResultSet rs = stmt.executeQuery("SELECT * FROM odeljenja WHERE id_korisnika='" + idLekara + "'");
                                    if (rs.next()) {
                                        odeljenjeNacelnika = rs.getString("id_odeljenja");
                                        out.println("<li class='dropdown active'>"
                                                + "<a class='dropdown-toggle' data-toggle='dropdown' href='#'>"
                                                + "Funkcije nacelnika<span class='caret'></span>"
                                                + "</a>"
                                                + "<ul class='dropdown-menu'>"
                                                + " <li><a href='PretragaLekara.jsp'>Pregled Lekara</a></li>"
                                                + "<li><a href='UnosSpecijaliste.jsp'>Unos Specijaliste</a></li>"
                                                + "<li><a href='NacelnikKartoni.jsp'>Prijemni list</a></li>"
                                                + "</ul>"
                                                + "</li>");
                                    }

                                %>
                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->

            </nav>
                     <form class="form-signin" method="GET" action="DodajLekaraSpecijalistu">
                <h2 class="form-signin-heading">Dodavanje lekara specijaliste</h2>
                <p style="color:red;">${poruka}</p>
                <label for="imeLekara">Ime lekara:</label>
                <input id="imeLekara" type="text" class="form-control" placeholder="Ime" name="imeLekara" required>
                
                <label for="prezimeLekara">Prezime lekara:</label>
                <input id="prezimeLekara" type="text" class="form-control" placeholder="Prezime" name="prezimeLekara" required>
                
                <label for="polLekara">Pol:</label>
                <select name="polLekara" class="form-control" id="polLekara">
                    <option value="muski">Muski</option>
                    <option value="zenski">Zenski</option>
                </select>

                <label for="usernameLekara">Username:</label>
                <input id="usernameLekara" type="text" class="form-control" placeholder="Username" name="usernameLekara" required>

                <label for="passwordLekara">Password:</label>
                <input id="passwordLekara" type="text" class="form-control" placeholder="Password" name="passwordLekara" required>

                <label for="jmbgLekara">JMBG:</label>
                <input id="jmbgLekara" type="text" class="form-control" placeholder="JMBG" name="jmbgLekara" required>

                <label for="adresaLekara">Adresa:</label>
                <input id="adresaLekara" type="text" class="form-control" placeholder="Adresa" name="adresaLekara" required>

                <label for="telefonLekara">Telefon:</label>
                <input id="telefonLekara" type="text" class="form-control" placeholder="Telefon" name="telefonLekara" required>

                <label for="emailLekara">Email:</label>
                <input id="emailLekara" type="text" class="form-control" placeholder="E-mail" name="emailLekara" required>
                
                <input type="hidden" name="tipLekara" value="specijalista">
                
                

                <br/><button class="btn btn-lg btn-primary btn-block" type="submit">Dodaj lekara</button>
            </form>
        </div>
    </body>
    <%        DB.getInstance().putConnection(con);
    %>
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>           
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</html>
