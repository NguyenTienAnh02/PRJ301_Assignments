<%-- 
    Document   : authenbox
    Created on : Oct 11, 2023, 1:59:07 PM
    Author     : sonnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.account ne null}">
            Hello ${sessionScope.account.displayname}.
        </c:if>    
        <c:if test="${sessionScope.account eq null}">
            You did not login;
        </c:if>      
    </body>
</html>
