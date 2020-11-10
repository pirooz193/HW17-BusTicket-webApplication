package ir.maktab.servlets;

import ir.maktab.domains.Account;
import ir.maktab.service.AccountService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/signUp")
public class signUp extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String gender = req.getParameter("gender");


        AccountService accountService = new AccountService();
        if (accountService.getAccount(username, password).isEmpty()) {
            Account account = new Account();
            account.setUsername(username);
            account.setPassword(password);
            account.setGender(gender);
            accountService.generateAccount(account);
            RequestDispatcher dispatcher = req.getRequestDispatcher("getTicket.jsp");
            dispatcher.forward(req,resp);
        }

    }
}
