<%-- 
    Document   : timetable
    Created on : Oct 18, 2023, 2:16:05 PM
    Author     : sonnt
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="https://play-lh.googleusercontent.com/BFYTO8vhN2ZveSWA7XGoQVwei9cCvpi2je5eyDI2a1WoKxTjJJw5Sv8ULoQEGqAYo0g" type="image/x-icon">
        <title>JSP Page</title>
        <style>
            * {
                box-sizing: border-box;
            }

            table td {
                border: 1px solid black;
                border-collapse: collapse;
                width: 600px;
                height: 100px;
            }
            
            table{
                margin-top: -20px;
            }

            .groupname{
                box-sizing: border-box;
                background-color: #337ab7;
                display: inline-block;
                color: #fff;
                padding: 2px 5px;
                border-radius: 5px;
                font-weight: bold;
            }
            
            .slottime{
                box-sizing: border-box;
                background-color: #58BF36;
                display: inline-block;
                color: #fff;
                padding: 2px 5px;
                border-radius: 5px;
                font-weight: bold;
            }

            .table-head{
                text-align: center;
                background-color: #6b90da;
                color: #ffffff;
                text-shadow: .5px .5px #333333;
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            }

            input[type="submit"] {
                background-color: #FFA500;
                border: none;
                color: white;
                padding: 6px 10px;
                display: inline-block;
                font-size: 14px;
                margin: 2px 2px;
                cursor: pointer;
                border-radius: 4px;
                position: relative;
                overflow: hidden;
            }
            .att:hover{
                transform: scaleX(1.06);
            }
            input[type="submit"]:hover{
                transform: scaleX(1.02);
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
            .scroll-to-left-btn {
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
            .scroll-to-left-btn.show {
                display: block;
            }

            /* On hover, change background color and add box-shadow */
            .scroll-to-left-btn:hover {
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
                if (document.body.scrollLeft > 10 || document.documentElement.scrollLeft > 10) {
                    mybutton.style.display = "block";
                } else {
                    mybutton.style.display = "none";
                }
            }

            // When the user clicks on the button, scroll to the top of the document
            function leftFunction() {
                document.body.scrollLeft = 0;
                document.documentElement.scrollLeft = 0;
            }
        </script> 
    </head>
    <body>
        <button class="scroll-to-left-btn" onclick="leftFunction()" id="myBtn" title="Go to top"><i class="fa-solid fa-arrow-up"></i></button>
        <nav class="navbar">
            <a href="/PRJ301_Assignments/" class="navbar-logo"><i class="fa-solid fa-house-chimney"></i></a>
            <div class="navbar-links">
                <a href="../logout">Logout</a>
            </div>
        </nav> 

        <h1 style="text-align: center ;margin-top: 5px">Weekly Timetable</h1>
        <h1 style="text-align: center"></h1><br/>

        <table>
            <tr class="table-head">
                <td>
                    <form action="timetable" method="GET">
                        <input type="hidden" name="id" value="${param.id}"/>
                        From <input type="date" value="${requestScope.from}" name="from"/><br/> 
                        To <input type="date" value="${requestScope.to}" name="to"/> <br/>
                        <input type="submit" value="View schedule"/>
                    </form>
                </td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td style="font-weight: bold;">
                        <fmt:formatDate value="${d}" pattern="EEEE"/><br/>
                        <fmt:formatDate value="${d}" pattern="dd/MM"/>                 
                    </td>
                </c:forEach>
            </tr>

                <c:forEach items="${requestScope.slots}" var="s" varStatus="loop">
            <tr>
                    <td>
                        <div style="text-align: center">Slot ${s.id}</div>
                    </td>  
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.sessions}" var="k">
                                <c:if test="${k.date eq d and k.slot.id eq s.id}">
                                    
                                    <a class="att" style="font-weight: bold; display: flex;text-decoration: none;color: black"
                                       href="attendance?id=${k.id}">
                                       ${k.group.subject.name} at ${k.room.id}
                                    </a>
                                    
                                    <c:if test="${k.isAtt}">
                                        <div style="color: green">(Takend)</div>
                                    </c:if>
                                    <c:if test="${!k.isAtt}">
                                        <div style="color: red">(Not yet)</div>
                                    </c:if>  
                                    <div class="groupname">${k.group.name}</div>
                                    <div class="slottime" style="text-align: center">${s.description}</div>
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
