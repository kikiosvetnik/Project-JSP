<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="Database.DB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pretraga Pacijenta</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

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
                            <li><a href="lekarIndex.jsp">Pocetna</a></li>
                            <li class="active"><a href="PretragaPacijenta.jsp">Pretraga Pacijenta</a></li>
                            <li><a href="pisanjeIzvestajaOP.jsp">Pisanje Izvestaja</a></li>
                            <li><a href="#">Pisanje Uputa</a></li>


                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->

            </nav>
            <form class="form-inline" method="GET" action="PretragaPacijenta.jsp">                          
                <div class="form-group">
                    <label for="ImePacijenta">Ime: </label>
                    <input type="text" class="form-control" id="ImePacijenta" name="ImePacijenta" placeholder="Ime">
                </div>
                <div class="form-group">
                    <label for="PrezimePacijenta">Prezime: </label>
                    <input type="text" class="form-control" id="PrezimePacijenta" name="PrezimePacijenta" placeholder="Prezime">
                </div>
                <button type="submit" class="btn btn-primary">Pretrazi</button>
            </form><br/>
            <form class="form-inline" method="GET" action="PretragaPacijenta.jsp">
                <div class="form-group">
                    <label for="idPacijenta">ID Pacijenta: </label>
                    <input type="text" class="form-control" id="idPacijenta" name="idPacijenta" placeholder="ID">
                </div>
                <button type="submit" class="btn btn-warning">Pretrazi ID</button>

            </form>


            <%
                Connection con = DB.getInstance().getConnection();
                Statement stmt = con.createStatement();
                ResultSet rs;

                if (request.getParameter("ImePacijenta") != null || request.getParameter("PrezimePacijenta") != null) {
                    out.println("<h4>Rezultat pretrage:</h4>");
                    rs = stmt.executeQuery("SELECT * FROM korisnici "
                            + "WHERE ime LIKE '%" + request.getParameter("ImePacijenta") + "%' "
                            + "AND prezime LIKE '%" + request.getParameter("PrezimePacijenta") + "%' "
                            + "AND tip_korisnika='pacijent'"
                            + "AND odobren='1'");


            %>
            <table class="table table-condensed">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Ime</th>
                        <th>Prezime</th>
                        <th>Pol</th>
                        <th>Jmbg</th>
                        <th>Adresa</th>
                        <th>Telefon</th>
                        <th>Email</th>
                        <th>Pregled Lecenja</th> 
                    </tr>
                </thead>
                <tbody>
                    <%                            while (rs.next()) {
                                out.println("<tr><td>" + rs.getString("id_korisnika") + "</td>"
                                        + "<td>" + rs.getString("ime") + "</td>"
                                        + "<td>" + rs.getString("prezime") + "</td>"
                                        + "<td>" + rs.getString("pol") + "</td>"
                                        + "<td>" + rs.getString("jmbg") + "</td>"
                                        + "<td>" + rs.getString("adresa") + "</td>"
                                        + "<td>" + rs.getString("telefon") + "</td>"
                                        + "<td>" + rs.getString("email") + "</td>"
                                        + "<td><form method='GET' action='PregledPacijenta.jsp'>"
                                        + "<input type='hidden' name='id_pac' value='" + rs.getString("id_korisnika") + "' />"
                                        + "<button type='submit' class='btn btn-warning'>Pregled</button>"
                                        + "</form></td>"
                                        + "</tr>");
                            }
                        }
                        

                    %>
                </tbody>
            </table>
            <%                if (request.getParameter("idPacijenta") != null) {
                    out.println("<h4>Rezultat pretrage:</h4>");
                    rs = stmt.executeQuery("SELECT * FROM korisnici WHERE id_korisnika='" + request.getParameter("idPacijenta") + "'"
                            + "AND tip_korisnika='pacijent'"
                            + "AND odobren='1'");
            %>
            <table class="table table-condensed">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Ime</th>
                        <th>Prezime</th>
                        <th>Pol</th>
                        <th>Jmbg</th>
                        <th>Adresa</th>
                        <th>Telefon</th>
                        <th>Email</th>
                        <th>Pregled Lecenja</th> 
                    </tr>
                </thead>
                <tbody>
                    <%                            while (rs.next()) {
                                out.println("<tr><td>" + rs.getString("id_korisnika") + "</td>"
                                        + "<td>" + rs.getString("ime") + "</td>"
                                        + "<td>" + rs.getString("prezime") + "</td>"
                                        + "<td>" + rs.getString("pol") + "</td>"
                                        + "<td>" + rs.getString("jmbg") + "</td>"
                                        + "<td>" + rs.getString("adresa") + "</td>"
                                        + "<td>" + rs.getString("telefon") + "</td>"
                                        + "<td>" + rs.getString("email") + "</td>"
                                        + "<td><form method='GET' action='PregledPacijenta.jsp'>"
                                        + "<input type='hidden' name='id_pac' value='" + rs.getString("id_korisnika") + "' />"
                                        + "<button type='submit' class='btn btn-warning'>Pregled</button>"
                                        + "</form></td>"
                                        + "</tr>");
                            }
                        }
                        
                        
                        DB.getInstance().putConnection(con);

                    %>
                </tbody>
            </table>
        </div>

    </body>

    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>           
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</html>
