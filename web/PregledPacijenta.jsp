<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="Database.DB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pregled Pacijenta</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

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
                            <li class="active"><a href="PretragaPacijenta.jsp">Pretraga Pacijenta</a></li>
                            <li><a href="pisanjeIzvestajaOP.jsp">Pisanje Izvestaja</a></li>
                            <li><a href="#">Pisanje Uputa</a></li>


                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->

            </nav> 
            <h4><a href="PretragaPacijenta.jsp">Vrati se nazad <<<</a></h4>
            <% 
                Connection con = DB.getInstance().getConnection();
                Statement stmt = con.createStatement();
                ResultSet rs = null;
                
                if(request.getParameter("id_pac")!=null){
                    out.println("<h4>Pregled Istorije lecenja:</h4>");
                    rs = stmt.executeQuery("SELECT * FROM izvestaj_lekara "
                            + "WHERE id_korisnika='"+request.getParameter("id_pac")+"'");
                            
                    %>
             <table class="table table-condensed">
                <thead>
                    <tr>
                        <th>ID izvstaja</th>
                        <th>Datum</th>
                        <th>Dijagnoza</th>
                        <th>Bolest</th>
                        <th>Tegoba</th>
                        <th>Terapija</th>
                        <th>Datum kontrole</th>
                        <th>napomena</th>
                        
                    </tr>
                </thead>
                <tbody>
            <%
                    while(rs.next()){
                        out.println("<tr><td>"+rs.getString("id_izvestaja")+"</td>"
                                + "<td>"+rs.getString("datum")+"</td>"
                                + "<td>"+rs.getString("dijagnoza")+"</td>"
                                + "<td>"+rs.getString("naziv_bolesti")+"</td>"
                                + "<td>"+rs.getString("tegoba")+"</td>"
                                + "<td>"+rs.getString("terapija")+"</td>"
                                + "<td>"+rs.getString("datum_kontrole")+"</td>"
                                + "<td>"+rs.getString("napomena")+"</td>"
                                +"</tr>");
                    }
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
