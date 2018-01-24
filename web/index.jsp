<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Zdravstvena ustanova</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <div class="container">
            <form name="loginForm" class="form-signin" method="POST" action="Login" onsubmit="return loginValidation();">
                <h2 class="form-signin-heading">Web servis Zdravstvene Ustanove</h2>
                <p style="color:red;">${poruka}</p>
                <input type="text" class="form-control" placeholder="Username" name="username" id="username" required><br/>
                <input type="password" class="form-control" placeholder="Password" name="password" id="password" required>
                <a href="register.jsp">Registruj se</a> <a href="promenaLozinke.jsp">Promeni lozinku</a><br/><br/>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form> 
        </div>


        <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
