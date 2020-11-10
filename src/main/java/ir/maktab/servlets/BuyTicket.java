package ir.maktab.servlets;

import ir.maktab.domains.Account;
import ir.maktab.domains.Ticket;
import ir.maktab.domains.Trip;
import ir.maktab.service.AccountService;
import ir.maktab.service.TicketService;
import ir.maktab.service.TripService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/BuyTicket")
@MultipartConfig
public class BuyTicket extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("uname");
        String origin = req.getParameter("orig");
        String destination = req.getParameter("dest");
//        String date = req.getParameter("date");
//        Date date = (Date) req.getPart("date");
        Ticket ticket = new Ticket();
        TicketService ticketService = new TicketService();

        TripService tripService = new TripService();
        Trip trip = tripService.getTripByOriginAndDestionation(origin,destination).get(0);

        AccountService accountService = new AccountService();
        Account account = accountService.getAccountByUsername(username).get(0);

        ticket.setAccount(account);
        ticket.setOrigin(origin);
        ticket.setDestination(destination);
        ticket.setTrip(trip);

        account.getTickets().add(ticket);
        account.getTrips().add(trip);
        accountService.updateAccount(account);
//        ticket.setStartDate(date);
//        ticketService.generateTicket(ticket);
        RequestDispatcher dispatcher = req.getRequestDispatcher("okBox.jsp");
        dispatcher.forward(req,resp);

    }
}
