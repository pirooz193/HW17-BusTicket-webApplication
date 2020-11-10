<%@ page import="ir.maktab.domains.Account" %>
<%@ page import="ir.maktab.domains.Ticket" %>
<%@ page import="ir.maktab.service.AccountService" %>
<%@ page import="ir.maktab.service.TicketService" %><%--
  Created by IntelliJ IDEA.
  User: Kamtel
  Date: 11/9/2020
  Time: 9:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <title>:)</title>
    <link rel="stylesheet" href="wrongInfo.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="alert alert-success warnings" role="alert">
    <%
        AccountService accountService = new AccountService();
        Account account = new Account();
        String username = request.getParameter("uname");
        account =  accountService.getAccountByUsername(username).get(0);
        Ticket ticket = new Ticket();
        TicketService ticketService = new TicketService();
//        ticketService.

        if (account.getGender().equals("آقا")) {
    %>
    <h4 class="alert-heading">خرید بلیط شما با موفقیت انجام شد.<%=account.getUsername()%>آقای</h4><br>
    <%
        }
        else if (account.getGender().equals("خانم")){
           %>
    <h4 class="alert-heading">خرید بلیط شما با موفقیت انجام شد.<%=account.getUsername()%>خانم</h4><br>

    <%
        }
    %>


    <div class="container spinners">
        <div class="spinner-grow text-danger"></div>
        <div class="spinner-grow text-warning"></div>
        <div class="spinner-grow text-danger"></div>
        <div class="spinner-grow text-warning"></div>
        <div class="spinner-grow text-danger"></div>
        <div class="spinner-grow text-warning"></div>
        <div class="spinner-grow text-danger"></div>
        <div class="spinner-grow text-warning"></div>
        <div class="spinner-grow text-danger"></div>
    </div>
    <hr>
<%--شناسه ی بلیط :<%=ticket.getId()%>--%>
</div>
</body>
</html>

