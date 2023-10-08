<%-- 
    Document   : Attendance
    Created on : Oct 8, 2023, 10:49:10 PM
    Author     : anh40
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Time Table</title>
        <link href="css/attendance.css" rel="stylesheet">
    </head>
    <body class="background_img" style="background-image: url('img/admin.jpg');">

        <h1>My Timetable</h1><br>
        <form action="attendance" method="post">
            <table class="myTimetable">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>GROUP</th>
                        <th>CODE</th>
                        <th>NAME</th>
                        <th>IMAGE</th>
                        <th>ABSENT</th>
                        <th>PRESENT</th>
                        <th>COMMENT</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>1</td>
                        <td>
                            <div>SE1763</div>
                        </td>
                        <td>
                            <div>HE164035</div>
                        </td>
                        <td>
                            <div>Nguyễn Tiến Anh</div>
                        </td>
                        <td>
                            <<img src="src" width="width" height="height" alt="alt"/>
                        </td>
                        <td>
                            <input type="radio"/>
                        </td>
                        <td>
                            <input type="radio"/>
                        </td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
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
                        <td>3</td>
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
                        <td>4</td>
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
                </tbody>
            </table>
        </form><br>
        <input type="submit"  value="Logout"/> 
    </body>
</html>
