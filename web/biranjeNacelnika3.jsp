<%@page import="Database.DB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biranje nacelnika</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
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
                            <li><a href="adminIndex.jsp">Pocetna</a></li>
                            <li><a href="dodavanjeUstanova.jsp">Ustanova</a></li>
                            <li><a href="dodajOdeljenje.jsp">Odeljenja</a></li>
                            <li class="active"  class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    Korisnici<span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="dodavanjeLekara.jsp">Dodavanje Lekara</a></li>
                                    <li><a href="prihvatiKorisnika.jsp">Prihvatanje korisnika</a></li>
                                    <li><a href="biranjeNacelinika.jsp">Biranje nacelnika</a></li>
                                </ul> 
                            </li>

                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->

            </nav>
            <form class="form-signin" method="GET" action="BiranjeNacelnika">
                <h2 class="form-signin-heading">Biranje Nacelnika</h2>
                <p style="color:red;">${poruka}</p>
                <%
                    out.println("<input type='hidden' name='idOdeljenja' value='"+request.getParameter("idOdeljenja")+"'"+"></input>");
                    %>
                <label for="sel1">Odeljenje:</label>
                <select class="form-control" id="sel1" name="idKorisnika">
                    <option value="0">-- Izaberi Lekara --</option>
                    <%
                        Connection con = DB.getInstance().getConnection();
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT k.id_korisnika,k.ime,k.prezime FROM korisnici k, lekari l WHERE l.id_korisnika = k.id_korisnika AND l.id_odeljenja='"+request.getParameter("idOdeljenja")+"' AND k.tip_korisnika='specijalista'");
                        
                        while (rs.next()) {
                            
                                out.println("<option value='" + rs.getString("id_korisnika") + "'>" + rs.getString("ime") + " " + rs.getString("prezime") + "</option>");
                          
                        }
                        DB.getInstance().putConnection(con);
                    %>
                </select><br/>                

                <button class="btn btn-lg btn-primary btn-block" type="submit">Izaberi Lekara</button>
            </form>

        </div>
    </body>


    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>           
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</html>
