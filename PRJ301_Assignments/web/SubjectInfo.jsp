<%-- 
    Document   : SubjectInfo
    Created on : Oct 8, 2023, 1:30:57 PM
    Author     : anh40
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject Info</title>
        <link href="css/subjectinfo.css" rel="stylesheet"> 
    </head>
    <body style="background-image: url('img/admin.jpg');">
        <form action="info" method="post" id="admin1">
            <h2>Information of the Subject</h2>
            <div class="table-wrapper">
                <table class="fl-table">
                    <thead>
                        <tr>
                            <th>SUBJECT INFORMATION</th>
                        </tr>
                    </thead>
                    <tr>
                        <td>Subject Name: Java Web Application Development(PRJ301)</td>
                    </tr>
                    <tr>
                        <td>Instructor: Ngô Tùng Sơn (sonnt5)</td>
                    </tr>
                    <tr>
                        <td>Course Name: Software Engineering</td>
                    </tr>
                    <tr>
                        <td>Semester: 4</td>
                    </tr>
                    <tr>
                        <td>Class: SE1763</td>
                    </tr>
                     <tr>
                        <td>Absent: 4/20</td>
                    </tr>
                </table>
            </div>
        </form>             
    </body>
</html>
