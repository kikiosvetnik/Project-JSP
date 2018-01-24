<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="registerStyle.css">
        
    </head>
    <body>
        <div class="container">
            <h2 style="text-align: center">Registracija</h2>
            <form class="form-horizontal" role="form" action="register" method="POST" onsubmit="return registerValidation()">
                <div class="form-group">

                    <label for="Ime" class="col-sm-3 control-label">Ime</label>
                    <div class="col-sm-9">
                        <input type="text" id="ime" placeholder="Ime" name="ime" class="form-control" autofocus required>
                    </div>
                </div><!--end of form-group-->
                <div class="form-group">

                    <lable for="prezime" class="col-sm-3 control-label">Prezime</lable>
                    <div class="col-sm-9">
                        <input type="text" id="prezime" placeholder="Prezime" name="prezime" class="form-control" required>
                    </div>
                </div><!--end of form-group-->
                <div class="form-group">
                    <label class="control-label col-sm-3">Pol</label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" id="femaleRadio" name="pol" value="zenski">Z
                                </label>
                            </div>
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" id="maleRadio" name="pol" value="muski" checked="checked">M
                                </label>
                            </div>

                        </div>
                    </div>
                </div><!--end of form-group-->
                <div class="form-group">
                    <label for="username" class="col-sm-3 control-label">Username</label>
                    <div class="col-sm-9">
                        <input type="text" id="username" name="username" placeholder="Username" class="form-control" required>
                    </div>
                </div><!--end of form-group-->
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Password</label>
                    <div class="col-sm-9">
                        <input type="password" id="password" placeholder="Password" name="password1" class="form-control" required>
                    </div>
                </div><!--end of form-group-->

                <div class="form-group">
                    <label for="potvrdaPassword" class="col-sm-3 control-label">Potvrda </label>
                    <div class="col-sm-9">
                        <input type="password" id="passwordPassword" placeholder="Potvrda Password" name="password2" class="form-control" required>
                    </div>
                </div><!--end of form-group-->
                <div class="form-group">
                    <label for="jmbg" class="col-sm-3 control-label">JMBG</label>
                    <div class="col-sm-9">
                        <input type="text" id="username" name="jmbg" placeholder="JMBG" class="form-control" required>
                    </div>
                </div><!--end of form-group-->
                <div class="form-group">
                    <label for="nosilac" class="col-sm-3 control-label">Nosilac Osiguranja</label>
                    <div class="col-sm-9">
                        <input type="text" id="nosilac" name="nosilac" placeholder="Nosilac osiguranja" class="form-control" required>
                    </div>
                </div><!--end of form-group-->
                <div class="form-group">
                    <label for="srodstvo" class="col-sm-3 control-label">Srodstvo</label>
                    <div class="col-sm-9">
                        <input type="text" id="srodstvo" name="srodstvo" placeholder="Srodstvo sa nosiocem" class="form-control" required>
                    </div>
                </div><!--end of form-group-->
                <div class="form-group">
                    <label for="adresa" class="col-sm-3 control-label">Adresa</label>
                    <div class="col-sm-9">
                        <input type="text" id="adresa" name="adresa" placeholder="Ulica/Broj/Grad" class="form-control" required>
                    </div>
                </div><!--end of form-group-->
                <div class="form-group">
                    <label for="telefon" class="col-sm-3 control-label">Telefon</label>
                    <div class="col-sm-9">
                        <input type="text" id="telefon" name="telefon" placeholder="Telefon" class="form-control" required>
                    </div>
                </div><!--end of form-group-->
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9">
                        <input type="text" id="email" name="email" placeholder="Email" class="form-control" required>
                    </div>
                </div><!--end of form-group-->
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary btn-block">Registruj se</button>

                    </div>
                    <a href="index.jsp">Log in</a><br/>
                    <a href="promenaLozinke.jsp">Promena lozinke</a>
                </div>
            </form>   

        </div>



        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
