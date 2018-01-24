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
                            <li class="active"><a href="specIndex.jsp">Pocetna</a></li>
                            <li><a href="pisanjeIzvestajaSP.jsp">Pisanje izvestaja</a></li>
                            <li><a href="PretragaPacijentaSP.jsp">Pretraga Pacijenata</a></li>
                                <%
                                    Connection con = DB.getInstance().getConnection();
                                    Statement stmt = con.createStatement();
                                    ResultSet rs = stmt.executeQuery("SELECT * FROM odeljenja WHERE id_korisnika='" + idLekara + "'");
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
                                    DB.getInstance().putConnection(con);
                                %>
                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->

            </nav>

            <div class="container theme-showcase" role="main">

               
                <div class="jumbotron">
                    <h1>${korisnik.ime} dobro dosli.</h1>
                    <p>Ovaj web servis vam omogucava pregled pacijenata kao i azuriranje njihovi kartona.</p>
                </div>
            </div>
        </div>
    </body>

    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>           
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</html>
