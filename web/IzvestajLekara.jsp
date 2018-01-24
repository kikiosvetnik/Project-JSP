<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="Database.DB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Izvestaj Lekara</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        
    </head>
    <body>
        <%
            HttpSession sesija = request.getSession(true);
            String idKor = (String)sesija.getAttribute("id");
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
          <li class="active"><a href="IzvestajLekara.jsp">Izvestaji Lekara</a></li>
          <li><a href="IzvestajSpecijaliste.jsp">Izvestaji Specijaliste</a></li>
        
        
       
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
          <li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
  
</nav>
            <table class="table table-condensed">
                <thead>
                    <tr>
                        <th>Datum</th>
                        <th>Dijagonoza</th>
                        <th>Bolest</th>
                        <th>Tegobe</th>
                        <th>Terapija</th>
                        <th>Napomena</th>
                        <th>Datum Kontrole</th>
                    </tr>
                </thead>
                <tbody>
        <%
            
            Connection con = DB.getInstance().getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM izvestaj_lekara WHERE id_korisnika='"+idKor+"'");
            while(rs.next()){
                out.println("<tr><td>"+rs.getString("datum")+"</td><td>"+rs.getString("dijagnoza")+"</td><td>"+rs.getString("naziv_bolesti")+"</td><td>"+rs.getString("tegoba")+"</td><td>"+rs.getString("terapija")+"</td><td>"+rs.getString("napomena")+"</td><td>"+rs.getString("datum_kontrole")+"</td></tr>");
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
