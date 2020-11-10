<%@ page import="ir.maktab.domains.Ticket" %>
<%@ page import="ir.maktab.service.TicketService" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Trips</title>
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
                    Long id = Long.valueOf(request.getParameter("ticketId"));
                    TicketService ticketService = new TicketService();
                    Ticket ticket = ticketService.getTicketByID(id);
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
                    SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("hh:mm");

                %>
                <div class="card-header-text">بلیط</div>
            </div>
            <table id="customers">
                <tr>
                    <td align="center"><%=ticket.getId()%></td>
                    <td align="center">شناسه ی بلیط</td>
                </tr>
                <tr>
                    <td align="center"><%=ticket.getAccount().getUsername()%></td>
                    <td align="center">نام</td>
                </tr>
                <tr>
                    <td align="center"><%=ticket.getAccount().getGender()%></td>
                    <td align="center">جنسیت</td>
                </tr>
                <tr>
                    <td align="center"><%=ticket.getTrip().getOrigin()%>
                    </td>
                    <td align="center">مبداء</td>
                </tr>
                <tr>
                    <td align="center"><%=ticket.getTrip().getDestination()%>
                    </td>
                    <td align="center">مقصد</td>
                </tr>
                <tr>
                    <td align="center"><%=simpleDateFormat.format(ticket.getTrip().getStartDate())%>
                    </td>
                    <td align="center">تاریخ حرکت</td>
                </tr>
                <tr>
                    <td align="center"><%=simpleDateFormat1.format(ticket.getTrip().getStartDate())%>
                    </td>
                    <td align="center">ساعت</td>
                </tr>
                <tr>
                    <td align="center"><%=ticket.getTrip().getId()%>
                    </td>
                    <td align="center">شناسه ی سفر</td>
                </tr>
            <%

            %>

        </div>
    </div>
</div>
</body>
</html>