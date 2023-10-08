<%-- 
    Document   : Schedule
    Created on : Oct 8, 2023, 1:05:22 PM
    Author     : anh40
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Time Table</title>
        <link href="css/schedule.css" rel="stylesheet">
    </head>
    <body class="background_img" style="background-image: url('img/schedule1.jpeg');">


        <h1>My Timetable</h1><br>
        <form action="schedule" method="post">
            <table class="myTimetable">
                <thead>
                    <tr>
                        <th>Week: 
                            <select>
                                <option value="">9/10 to 15/10</option>

                           </select>
                        </th>
                        <th>Monday</th>
                        <th>Tuesday</th>
                        <th>Wednesday</th>
                        <th>Thursday</th>
                        <th>Friday</th>
                        <th>Saturday</th>
                        <th>Sunday</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>Slot 1</td>
                        <td>


                        </td>
                        <td>


                        </td>
                        <td>


                        </td>
                        <td>


                        </td>
                        <td>


                        </td>
                        <td>


                        </td>
                        <td>


                        </td>
                    </tr>
                    <tr>
                        <td>Slot 2</td>
                        <td>


                        </td>
                        <td>


                        </td>
                        <td>


                        </td>
                        <td>


                        </td>
                        <td>


                        </td>
                        <td>


                        </td>
                        <td>


                        </td>
                    </tr>
                    <tr>
                        <td>Slot 3</td>
                        <td>
                            <div style="color: gray">(12:50-15:10)</div>
                            <a href="SubjectInfo.jsp" >FER201m-Thopn3</a><br>
                            <strong style="color: ">at BE-321</strong>

                        </td>

                        <td>                         
                        </td>

                        <td>
                            <div style="color: gray">(12:50-15:10)</div>
                            <a href="SubjectInfo.jsp" >PRJ301-Sonnt5</a><br>
                            <strong>at BE-202</strong>
                        </td>

                        <td>
                        </td>

                        <td>                           
                        </td>

                        <td>                            
                        </td>

                        <td>                          
                        </td>
                    </tr>
                    <tr>
                        <td>Slot 4</td>
                        <td>
                            <div style="color: gray">(15:20-17:40)</div>
                            <a href="SubjectInfo.jsp" >PRJ301-Sonnt5</a><br>
                            <strong>at BE-202</strong>

                        </td>
                        <td>


                        </td>
                        <td>

                            <div style="color: gray">(15:20-17:40)</div>
                            <a href="SubjectInfo.jsp" >FER201m-Thopn3</a><br>
                            <strong style="color: ">at BE-321</strong>
                        </td>
                        <td>


                        </td>
                        <td>


                        </td>
                        <td>


                        </td>
                        <td>

                        </td>
                    </tr>
                </tbody>
            </table>
        </form><br>
        <input type="submit"  value="Logout"/> 
    </body>
</html>
