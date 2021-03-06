<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dodavanje ustanova</title>
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
          <li class="active"><a href="dodavanjeUstanova.jsp">Ustanova</a></li>
        <li><a href="dodajOdeljenje.jsp">Odeljenja</a></li>
        <li class="dropdown">
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
            <form class="form-signin" method="GET" action="DodajUstanovu">
                <h2 class="form-signin-heading">Dodavanje ustanove</h2>
                <p style="color:red;">${poruka}</p>
                <label for="inputNazivUstanove">Naziv ustanove:</label>
                <input id="inputNazivUstanove" type="text" class="form-control" placeholder="Naziv ustanove" name="naziv" required><br/>
                <label for="inputAdresaUstanove">Adresa Ustanove:</label>
                <input id="inputAdresaUstanove" type="text" class="form-control" placeholder="Adresa" name="adresaUstanove" required><br/>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Dodaj ustanovu</button>
            </form>
         
        </div>
    </body>
        
        
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>           
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
      
</html>
