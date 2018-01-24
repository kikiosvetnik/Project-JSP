<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <h1>Dobrodosli!</h1>
        <p>Id korisnika:${korisnik.idKorisnika}<br/>
        Ime:${korisnik.ime}<br/>
        Prezime:${korisnik.prezime}<br/>
        Pol:${korisnik.pol}<br/>
        Username:${korisnik.username}<br/>
        Password:${korisnik.password}<br/>
        JMBG:${korisnik.jmbg}<br/>
        Adresa:${korisnik.adresa}<br/>
        Telefon:${korisnik.telefon}<br/>
        Email:${korisnik.email}<br/>
        TipKorisnika:${korisnik.tipKorisnika}<br/>
        Odobren:${korisnik.odobren}<br/>
        </p>
        <p>
            <a href="Logout" class="btn btn-warning" role="button">Logout</a>
        </p>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
