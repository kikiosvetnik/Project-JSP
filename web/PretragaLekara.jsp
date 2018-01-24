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
            <h4>Lekari na vasem odeljenju:</h4>
            <table class="table table-condensed">
                <thead>
                    <tr>
                        <th>Ime</th>
                        <th>Prezime</th>
                        <th>Pol</th>
                        <th>Jmbg</th>
                        <th>Adresa</th>
                        <th>Telefon</th>
                        <th>E - mail</th>
                       

                    </tr>
                </thead>
                <tbody>
                    <%
                    rs = null;
                    rs = stmt.executeQuery("SELECT * FROM korisnici k, lekari l WHERE k.id_korisnika = l.id_korisnika AND id_odeljenja='"+odeljenjeNacelnika+"' AND l.id_korisnika!='"+idLekara+"'");
                    while(rs.next()){
                        out.println("<tr>"
                                + "<td>"+rs.getString("ime")+"</td>"
                                + "<td>"+rs.getString("prezime")+"</td>"
                                + "<td>"+rs.getString("pol")+"</td>"
                                + "<td>"+rs.getString("jmbg")+"</td>"
                                + "<td>"+rs.getString("adresa")+"</td>"
                                + "<td>"+rs.getString("telefon")+"</td>"
                                + "<td>"+rs.getString("email")+"</td>"
                                
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
