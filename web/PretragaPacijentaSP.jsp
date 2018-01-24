<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="Database.DB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Specijalista</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    </head>
    <body>
        <%
            HttpSession sesija = request.getSession();
            String idKor = (String) sesija.getAttribute("id");
        %>


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
                            <li  class="active"><a href="PretragaPacijentaSP.jsp">Pretraga Pacijenata</a></li>
                                <%
                                    Connection con = DB.getInstance().getConnection();
                                    Statement stmt = con.createStatement();
                                    ResultSet rs = stmt.executeQuery("SELECT * FROM odeljenja WHERE id_korisnika='" + idKor + "'");
                                    if (rs.next()) {
                                        out.println("<li class='dropdown'>"
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

            <h4>Pretraga Pacijenata na odeljenju:</h4>
            <%
                rs = null;
                String idOde = "";
                String upit1 = "SELECT * FROM lekari WHERE id_korisnika='" + idKor + "'";

                rs = stmt.executeQuery(upit1);
                if (rs.next()) {
                    idOde = rs.getString("id_odeljenja");
                }
                String upit2 = "SELECT * FROM prijemni_list pl, korisnici k, pacijenti p WHERE pl.datum_odpustanja IS NULL AND id_odeljenja='" + idOde + "'" + "AND pl.id_pacijenta = k.id_korisnika AND k.id_korisnika = p.id_korisnika";
                rs = stmt.executeQuery(upit2);
            %>
            <table class="table table-responsive">
                <thead>
                    <tr>
                        <th>Ime i prezime</th>
                        <th>Pol</th>
                        <th>JMBG</th>
                        <th>Datum prijema</th>
                        <th>Bolest</th>
                        <th>Tegoba</th>
                        <th>Stanje</th>
                        <th>Pregled kartona</th>
                    </tr>
                </thead>
                <tbody>


                    <%
                        while (rs.next()) {
                            out.println("<tr>"
                                    + "<td>" + rs.getString("ime") + " " + rs.getString("prezime") + "</td>"
                                    + "<td>" + rs.getString("pol") + "</td>"
                                    + "<td>" + rs.getString("jmbg") + "</td>"
                                    + "<td>" + rs.getString("datum_prijema") + "</td>"
                                    + "<td>" + rs.getString("bolest") + "</td>"
                                    + "<td>" + rs.getString("tegoba") + "</td>"
                                    + "<td>" + rs.getString("stanje") + "</td>"
                                    + "<td><form method='get' action='PregledKartona.jsp'>"
                                    + "<input type='hidden' name='idPac' value='" + rs.getString("id_pacijenta") + "'>"
                                    + "<button type='submit' class='btn btn-warning'>Pregled Kartona</button>"
                                    + "</form></td>"
                                    + "</tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
    <%        DB.getInstance().putConnection(con);
    %>
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>           
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</html>
