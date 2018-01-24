<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="Database.DB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pisanje izvestaja 2</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>

        <%
            HttpSession sesija = request.getSession();
            String idLekara = (String) sesija.getAttribute("id");
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
                            <li ><a href="specIndex.jsp">Pocetna</a></li>
                            <li class="active"><a href="pisanjeIzvestajaSP.jsp">Pisanje izvestaja</a></li>
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
                                %>

                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->

            </nav>

            <form class="form-signin" method="GET" action="PisanjeIzvestajaSP">
                <h3>Pisanje Izvestaja:</h3>
                <label for="dijagnoza">Dijagnoza:</lable>
                    <input class="form-control" type="text" id="dijagnoza" name="dijagnoza" required>
                    <lable for="zakljucak">Zakljucak:</lable>
                    <input class="form-control" type="text" id="zakljucak" name="zakljucak" required><br/>
                    <%
                        out.println("<input type='hidden' name='idPacijenta' value='" + request.getParameter("idPacijenta") + "'" + "></input>");
                        out.println("<input type='hidden' name='datum' value='" + request.getParameter("datum") + "'" + "></input>");
                        out.println("<input type='hidden' name='disanje' value='" + request.getParameter("disanje") + "'" + "></input>");
                        out.println("<input type='hidden' name='puls' value='" + request.getParameter("puls") + "'" + "></input>");
                        out.println("<input type='hidden' name='temperatura' value='" + request.getParameter("temperatura") + "'" + "></input>");
                        out.println("<input type='hidden' name='pritisak' value='" + request.getParameter("pritisak") + "'" + "></input>");
                        out.println("<input type='hidden' name='mokraca' value='" + request.getParameter("mokraca") + "'" + "></input>");
                        out.println("<input type='hidden' name='stolica' value='" + request.getParameter("stolica") + "'" + "></input>");
                        out.println("<input type='hidden' name='krvnaSlika' value='" + request.getParameter("krvnaSlika") + "'" + "></input>");
                        out.println("<input type='hidden' name='specPregled' value='" + request.getParameter("specPregled") + "'" + "></input>");
                    %>

                    <button type="submit" class="btn btn-block btn-warning " >Napisi Izvestaj</button>
            </form>
        </div>

    </body>

    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>           
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</html>
