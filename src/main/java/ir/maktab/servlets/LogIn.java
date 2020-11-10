package ir.maktab.servlets;

import ir.maktab.service.AccountService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/logIn")
public class LogIn extends HttpServlet {


    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AccountService accountService = new AccountService();

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (!accountService.getAccount(username, password).isEmpty()) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("getTicket.jsp");
            dispatcher.forward(req, resp);

        } else resp.sendRedirect("WrongInfo.html");

    }
}
