<%@ page import="ir.maktab.service.AccountService" %>
<%@ page import="ir.maktab.domains.Account" %>
<%@ page import="ir.maktab.domains.Trip" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="ir.maktab.service.TicketService" %>
<%@ page import="ir.maktab.domains.Ticket" %><%--
  Created by IntelliJ IDEA.
  User: Kamtel
  Date: 11/9/2020
  Time: 9:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>بلیط های من</title>
    <meta charset="UTF-8">
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
            </div>

            <%
                String username = request.getParameter("uname");
                AccountService accountService = new AccountService();


                if (!accountService.getAccountByUsername(username).isEmpty()) {
            %>
            <div class="card-header">
                <div class="card-header-text">بلیط هایی که تا الان دریافت کرده اید</div>
            </div>
            <table id="customers">
                <tr>
                    <td align="center">تاریخ</td>
                    <td align="center">شناسه ی بلیط</td>
                    <td align="center">انتخاب</td>
                </tr>
                <%


                    Account account = accountService.getAccountByUsername(username).get(0);
                    Ticket ticket;

                    Trip trip1;
                    for (int i = 0; i < account.getTickets().size(); i++) {
                        ticket = account.getTickets().get(i);
                        trip1 = ticket.getTrip();
                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
                %>

                <tr>
                    <td align="center"><%=simpleDateFormat.format(trip1.getStartDate())%>
                    </td>
                    <td align="center"><%=account.getTickets().get(i).getId()%>
                    </td>
                    <td align="center">
                        <form action="showTicket.jsp">
                        <input type="submit" value="مشاهده">
                        <input type="hidden" value="<%=ticket.getId()%>" name="ticketId">
                    </form>
                        <form action="./deleteTicket">
                            <input type="submit" value="لغو">
                            <input type="hidden" value="<%=username%>" name="username">
                            <input type="hidden" value="<%=account.getTickets().get(i).getId()%>" name="ticketId">
                        </form>
                    </td>
                </tr>


                <%
                    }%>
            </table>
            <%

            } else {
            %>
            <div class="card-header">
                <div class="card-header-text">هیچ بلیطی یافت نشد</div>
            </div>
            <%
                }
            %>

        </div>
    </div>
</div>
</body>
</html>
