<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="ir.maktab.domains.Trip" %>
<%@ page import="ir.maktab.service.TripService" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@page pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>
<head>
    <title>سفرها</title>
    <meta http-equiv="Content-Language" content="fa">
    <meta http-equiv="Content-Type" language="java" content="text/html; charset=utf-8" pageDecoding="utf-8">
    <link rel="shortcut icon" type="image/x-icon" href="https://img.icons8.com/emoji/48/000000/bus-emoji.png"/>


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="trips.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="div1" class="buses">
    <img src="https://img.icons8.com/dusk/64/000000/bus2.png"/>
</div>
<!------------->
<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="card">
            <div class="card-header">
                <div class="d-flex justify-content-end social_icon">
                    <img src="https://img.icons8.com/emoji/48/000000/bus-emoji.png"/>
                </div>
                <%
                    response.setContentType("text/html;charset=UTF-8");
                    String username = request.getParameter("username");
                    String origin = request.getParameter("origin");
                    String destination = request.getParameter("destination");
                    Trip trip ;
                    TripService tripService = new TripService();
                    SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy/MM/dd");
                    if (!tripService.getTripByOriginAndDestionation(origin, destination).isEmpty()) {
                        trip = tripService.getTripByOriginAndDestionation(origin, destination).get(0);
                %>
                <div class="card-header-text">مسیر:<%=origin %>-<%=destination%>
                </div>
                <div class="card-header-text date"><%= simpleDateFormat1.format(trip.getStartDate())%>
                </div>

            </div>
            <table id="customers">
                <tr>
                    <td align="center">شناسه ی سفر</td>
                    <td align="center">ساعت حرکت</td>
                    <td align="center">انتخاب</td>
                </tr>
                <%
                    for (Trip trip1 : tripService.getTripByOriginAndDestionation(origin, destination)) {
                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm");
                %>

                <tr>
                    <td align="center"><%=trip1.getId()%>
                    </td>
                    <td align="center"><%=simpleDateFormat.format(trip1.getStartDate())%>
                    </td>
                    <td align="center">
                        <form action="./BuyTicket">
                            <input type="submit" value="خرید">
                            <input type="hidden" name="uname" value=<%=username%>>
                            <input type="hidden" name="orig" value=<%=origin%>>
                            <input type="hidden" name="dest" value=<%=destination%>>
                            <input type="hidden" name="date" value=<%=simpleDateFormat1.format(trip.getStartDate())%>>
                        </form>
                    </td>
                </tr>

                <%
                    }

                } else {
                %>
                <div class="card-header-text">هیچ سفری یافت نشد</div>
                <% }

                %>
            </table>
        </div>
    </div>
</div>
</body>
</html>