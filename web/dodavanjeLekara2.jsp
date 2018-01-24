<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DB"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dodavanje lekara</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
        
        <%
            String imeLekara = request.getParameter("imeLekara");
            String prezimeLekara = request.getParameter("prezimeLekara");
            String polLekara = request.getParameter("polLekara");
            String usernameLekara = request.getParameter("usernameLekara");
            String passwordLekara = request.getParameter("passwordLekara");
            String jmbgLekara = request.getParameter("jmbgLekara");
            String adresaLekara = request.getParameter("adresaLekara");
            String telefonLekara = request.getParameter("telefonLekara");
            String emailLekara = request.getParameter("emailLekara");
            String tipLekara = request.getParameter("tipLekara");
            String ustanovaLekara = request.getParameter("ustanovaLekara");   
        %>
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavBar">
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
        <li class="active" class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                Korisnici<span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="dodavanjeLekara.jsp">Dodavanje Lekara</a></li>
                <li><a href="prihvatiKorisnika.jsp">Prihvatanje korisnika</a></li>
                <li><a href="biranjeNacelnika.jsp">Biranje nacelnika</a></li>
            </ul> 
        </li>
       
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->

            </nav>
            <form class="form-signin" method="GET" action="DodajLekara">
                <h2 class="form-signin-heading">Dodavanje lekara</h2>
                <p style="color:red;">${poruka}</p>
                
                <lable for="OdeljenjeLekara">Odeljenje lekara:</lable>
                <select name="OdeljenjeLekara" class="form-control" id="OdeljenjeLekara">
                    <%
                        Connection con = DB.getInstance().getConnection();
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM odeljenja WHERE id_ustanove='"+request.getParameter("ustanovaLekara")+"'");
                        while(rs.next()){
                            out.println("<option value='"+rs.getString("id_odeljenja")+"'>" + rs.getString("naziv_odeljenja")+"</option>");
                        }
                        
                        DB.getInstance().putConnection(con);
                    %>
                </select>
                    <%
                    out.println("<input type='hidden' name='imeLekara' value='" + imeLekara + "'>");
                    out.println("<input type='hidden' name='prezimeLekara' value='" + prezimeLekara + "'>");
                    out.println("<input type='hidden' name='polLekara' value='" + polLekara + "'>");
                    out.println("<input type='hidden' name='usernameLekara' value='" + usernameLekara + "'>");
                    out.println("<input type='hidden' name='passwordLekara' value='" + passwordLekara + "'>");
                    out.println("<input type='hidden' name='jmbgLekara' value='" + jmbgLekara + "'>");
                    out.println("<input type='hidden' name='adresaLekara' value='" + adresaLekara + "'>");
                    out.println("<input type='hidden' name='telefonLekara' value='" + telefonLekara + "'>");
                    out.println("<input type='hidden' name='emailLekara' value='" + emailLekara + "'>");
                    out.println("<input type='hidden' name='tipLekara' value='" + tipLekara + "'>");
                    out.println("<input type='hidden' name='ustanovaLekara' value='" + ustanovaLekara + "'>");
                    %>
                <br/><button class="btn btn-lg btn-primary btn-block" type="submit">Unesi podatke o lekaru</button>
            </form>

        </div>
    </body>

    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>           
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
</html>
