<%-- 
    Document   : login
    Created on : Sep 27, 2023, 2:25:33 PM
    Author     : sonnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="login" method="POST">
            Username: <input type="text" name="username"/> <br/>
            Password: <input type="password" name="password" /> <br/>
            <input type="checkbox" name="remember" value="remember"/> Remember in this computer.
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>
 