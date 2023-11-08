<%-- 
    Document   : att
    Created on : Oct 23, 2023, 4:14:23 PM
    Author     : sonnt
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" href="https://play-lh.googleusercontent.com/BFYTO8vhN2ZveSWA7XGoQVwei9cCvpi2je5eyDI2a1WoKxTjJJw5Sv8ULoQEGqAYo0g" type="image/x-icon">
        <title>Lecturer Timetable</title>
        <style>
            * {
                box-sizing: border-box;
            }

            table td {
                border: 1px solid black;
                border-collapse: collapse;
                width: 100px;
                height: 50px;
            }
            
           table{
                margin-top: -20px;
            }
            
            .table-head{
                text-align: center;
                background-color: #6b90da;
                color: #ffffff;
                text-shadow: .5px .5px #333333;
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            }
            
            .att:hover{
                transform: scaleX(1.06);
            }
            
            .navbar {
                background-color: #f05123;
                color: #fff;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 20px;
            }

            .navbar-logo {
                font-size: 24px;
                font-weight: bold;
                text-decoration: none;
                color: #fff;
            }

            .navbar-links {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .navbar-links a {
                margin-left: 20px;
                text-decoration: none;
                color: #fff;
                font-weight: bold;
                font-size: 18px;
            }

            .navbar-links a:hover {
                color: gray;
                text-shadow:#eee;
            }
            /* Scroll to top button */
            .scroll-to-top-btn {
                position: fixed;
                bottom: 20px;
                right: 20px;
                z-index: 99;
                font-size: 16px;
                border: none;
                outline: none;
                background-color: #4CAF50;
                color: white;
                cursor: pointer;
                padding: 5px;
                border-radius: 50%;
                width: 40px;
                height: 40px;
                text-align: center;
            }

            /* Show button when user starts scrolling */
            .scroll-to-top-btn.show {
                display: block;
            }

            /* On hover, change background color and add box-shadow */
            .scroll-to-top-btn:hover {
                background-color: #555;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            }

        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script>
            // Get the button
            let mybutton = document.getElementById("myBtn");

            // When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction();
            };

            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    mybutton.style.display = "block";
                } else {
                    mybutton.style.display = "none";
                }
            }
            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>  
    </head>
    <body>
        <button class="scroll-to-top-btn" onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa-solid fa-arrow-up"></i></button>

        <nav class="navbar">
            <a href="/PRJ301_Assignments/" class="navbar-logo"><i class="fa-solid fa-house-chimney"></i></a>
            <div class="navbar-links">
                <a href="../logout">Logout</a>
            </div>
        </nav> 
        <h1 style="text-align: center">Take Attendance</h1><br/>
        <form action="attendance" method="POST">
            <table>
                <tr class="table-head">
                    <td>Student Name</td>
                    <td>ID</td>
                    <td>Image</td>
                    <c:forEach items="${requestScope.sessions}" var="item">
                        <td>
                            ${item.index}
                    <fmt:formatDate value="${item.date}" pattern="dd/MM"/>                 
                        </td>
                    </c:forEach>
                </tr>
                <c:forEach items="${requestScope.map}" var="a">
                    <tr>
                        <td style="width: 1100px">
                            ${a.key.name}
                        </td>
                        <td>
                            ${a.key.mssv}
                        </td>
                        <td><img src="src" alt="alt"/></td>
                        <c:forEach items="${requestScope.sessions}" var="item">
                            <c:set var="temp" value="0"/>
                            <c:forEach items="${a.value}" var="i">
                                <c:if test="${i.sesid == item.id}">
                                    <c:set var="temp" value="1"/>
                                </c:if>
                            </c:forEach>
                            <c:if test="${temp eq 1}">
                                <c:forEach items="${a.value}" var="i">
                                    <c:if test="${i.sesid == item.id}">
                                        <c:if test="${i.status eq true}">
                                            <td><div style="color: green">P</div></td>
                                        </c:if>
                                        <c:if test="${i.status eq false}">
                                            <td><div style="color: red">A</div></td>
                                        </c:if>
                                    </c:if>
                                </c:forEach>                           
                            </c:if>
                            <c:if test="${temp eq 0}">
                                <td></td>
                            </c:if>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </body>
</html>
