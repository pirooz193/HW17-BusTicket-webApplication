/*
package ir.maktab.demo;

import ir.maktab.domains.Account;
import ir.maktab.domains.Ticket;
import ir.maktab.domains.Trip;
import ir.maktab.service.AccountService;
import ir.maktab.service.TicketService;
import ir.maktab.service.TripService;

public class demo2 {

    public static void main(String[] args) {

        String origin = "تهران";
        String destination = "آمل";
        String username = "pirooz";

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


        System.out.println(ticket.getId());
        System.out.println("====================");
        System.out.println(trip.getId());
//        accountService.updateAccount(account);
    }
}
*/
