<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pacijent Index</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        
    </head>
    <body>
        <%
        session.getAttribute("kor");
        
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
          <li class="active"><a href="pacijentIndex.jsp">Pocetna</a></li>
          <li><a href="IzvestajLekara.jsp">Izvestaji Lekara</a></li>
          <li><a href="IzvestajSpecijaliste.jsp">Izvestaji Specijaliste</a></li>
        
        
       
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
                    <p>Ovaj web servis vam omogucava pregled vasih lekarskih pregleda kao i uvid izvestaja od lekara.</p>
                </div>
            </div>
         
        </div>
    </body>
        
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>           
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
   
</html>
