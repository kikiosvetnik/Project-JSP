<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Promena lozinke</title>
    </head>
    <body>        
        <div class="container">
            <form class="form-signin" method="POST" action="PromenaLozinke">
                <h2 class="form-signin-heading">Promena lozinke</h2>
                <p style="color:red">${poruka}</p>
                <input type="text" class="form-control" placeholder="Username" name="username" required></br>
                <input type="password" class="form-control" placeholder="Old Password" name="oldPassword" required></br>
                <input type="password" class="form-control" placeholder="New Password" name="newPassword" required><br/>
                <a href="index.jsp">Log in</a>
                <a href="promenaLozinke.jsp">Promena lozinke</a>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Promeni Password</button>
            </form>
        </div>

        <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>           
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
