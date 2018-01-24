<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="Database.DB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pisanje Uputa</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css"/>
        
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
                            <li><a href="PretragaPacijenta.jsp">Pretraga Pacijenta</a></li>
                            <li><a href="pisanjeIzvestajaOP.jsp">Pisanje Izvestaja</a></li>
                            <li class="active"><a href="pisanjeUputa.jsp">Pisanje Uputa</a></li>


                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->

            </nav>
            <h4>${poruka}</h4>
            <form class="form-signin" method="GET" action="pisanjeUputa.jsp">
                <h2 class="form-signin-heading">Pisanje Uputa</h2>
                 <label for="sel1">Ime i Prezime pacijenta:</label>
                <select class="form-control" id="sel1" name="idPacijenta">
                
                <%
                    Connection con = DB.getInstance().getConnection();
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM korisnici WHERE tip_korisnika='pacijent' AND odobren='1'");
                        while(rs.next()){
                            out.println("<option value='"+rs.getString("id_korisnika")+"'>"
                                    + rs.getString("id_korisnika")+" "
                                    + rs.getString("ime")+" "+rs.getString("prezime")
                                    +"</option>");
                        }
                %>
                </select>
                 <label for="idUstanove">Ustanova u koju se pacijent upucuje:</label>
                 <select class="form-control" id="idUstanove" name="idUstanove">
                     <%
                         rs = stmt.executeQuery("SELECT * FROM ustanove");
                         while(rs.next()){
                             out.println("<option value='"+rs.getString("id_ustanove")+"'>"+rs.getString("naziv_ustanove")+"</option>");
                         }
                         %>
                 </select>
                 <label for="datumPregleda">Datum pregleda:</label>
                 <input type="date" id="datumPregleda" class="form-control" name="datumPregleda">
                 <br/>
                 
                <button class="btn btn-lg btn-primary btn-block" type="submit">Izaberi pacijenta i ustanovu</button>
            </form>
        </div>
    </body>

    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>           
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</html>
