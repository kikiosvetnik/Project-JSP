<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="Database.DB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Izvestaj Specijaliste</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    </head>
    <body>
        <%
            HttpSession sesija = request.getSession(true);
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
                            <li><a href="pacijentIndex.jsp">Pocetna</a></li>
                            <li><a href="IzvestajLekara.jsp">Izvestaji Lekara</a></li>
                            <li class="active"><a href="IzvestajSpecijaliste.jsp">Izvestaji Specijaliste</a></li>
                            


                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->

            </nav>
            <h4>Izvestaji lekara specijaliste:</h4>
            <table class="table table-condensed">
                <thead>
                    <tr>
                        <th>ID izvestaja</th>
                        <th>ID nalaza</th>
                        <th>Datum</th>
                        <th>Dijagonoza</th>
                        <th>Zakljucak</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection con = DB.getInstance().getConnection();
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM izvestaji_specijaliste WHERE id_pacijenta='" + idKor + "'");
                        while (rs.next()) {
                            out.println("<tr>"
                                    + "<td>" + rs.getString("id_izvestaja") + "</td>"
                                     + "<td>" + rs.getString("id_nalaza") + "</td>"
                                    + "<td>" + rs.getString("datum") + "</td>"
                                    + "<td>" + rs.getString("dijagnoza") + "</td>"
                                    + "<td>" + rs.getString("zakljucak") + "</td>"
                                    + "</tr>");
                        }


                    %>
                </tbody>
            </table>
            <h4>Nalazi lekara Specijaliste:</h4>
            <table class="table table-condensed">
                <thead>
                    <tr>
                        <th>ID nalaza</th>
                        
                        <th>Datum</th>
                        <th>Disanje</th>
                        <th>Puls</th>
                        <th>Temperatura</th>
                        <th>Pritisak</th>
                        <th>Mokraca</th>
                        <th>Stolica</th>
                        <th>Krvna Slika</th>
                        <th>Specifican pregled</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        rs = stmt.executeQuery("SELECT * FROM nalazi WHERE id_pacijenta='" + idKor + "'");
                        while (rs.next()) {
                            out.println("<tr>"
                                    +"<td>"+rs.getString("id_nalaza")+"</td>"
                                    
                                    + "<td>" + rs.getString("datum") + "</td>"
                                    + "<td>" + rs.getString("disanje") + "</td>"
                                    + "<td>" + rs.getString("puls") + "</td>"
                                    + "<td>" + rs.getString("temperatura") + "</td>"
                                    + "<td>" + rs.getString("pritisak") + "</td>"
                                    + "<td>" + rs.getString("mokraca") + "</td>"
                                    + "<td>" + rs.getString("stolica") + "</td>"
                                    + "<td>" + rs.getString("krvna_slika") + "</td>"
                                    + "<td>" + rs.getString("specifican_pregled") + "</td>"
                                    + "</tr>");
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
