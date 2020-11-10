package ir.maktab.servlets;

import ir.maktab.domains.Account;
import ir.maktab.domains.Ticket;
import ir.maktab.service.AccountService;
import ir.maktab.service.TicketService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteTicket")
public class DeleteTicket extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Long id = Long.valueOf(req.getParameter("ticketId"));
        String username = req.getParameter("username");
        TicketService ticketService = new TicketService();
        Ticket ticket = ticketService.getTicketByID(id) ;
        AccountService accountService = new AccountService();
        Account account = accountService.getAccountByUsername(username).get(0);
        account.getTickets().remove(ticket);
        accountService.updateAccount(account);
        resp.sendRedirect("deleteBox.jsp");

    }
}
