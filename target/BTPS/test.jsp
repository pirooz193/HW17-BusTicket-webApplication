<%@ page import="ir.maktab.service.AccountService" %>
<%@ page import="ir.maktab.service.TripService" %><%--
  Created by IntelliJ IDEA.
  User: Kamtel
  Date: 11/8/2020
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    AccountService accountService = new AccountService();
    TripService tripService = new TripService();
    if (!accountService.getAccountByUsername("پیروز").isEmpty() ) {

%>
سلام پیروز

<%
    }
    else{
%>
چی شده؟؟
<%
    }
%>

</body>
</html>
