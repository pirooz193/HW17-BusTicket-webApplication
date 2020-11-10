package ir.maktab.test;

import ir.maktab.domains.Account;
import ir.maktab.domains.Ticket;
import ir.maktab.domains.Trip;
import ir.maktab.service.AccountService;
import ir.maktab.service.TicketService;
import ir.maktab.service.TripService;

import java.text.SimpleDateFormat;
import java.util.Date;


public class demo {


    public static void main(String[] args) {
        /*AccountService accountService = new AccountService();
        Account account = new Account();
        account.setUsername("پیروز");
        account.setPassword("123");
        account.setGender("آقا");
        accountService.generateAccount(account);
        System.out.println("finish");*/
       /* if (!accountService.getAccountByUsername("پیروز").isEmpty()){
            System.out.println("hi pirooz");
        }else{
            System.out.println("what happened");


        }*/
        TicketService ticketService= new TicketService();
        Ticket ticket = ticketService.getTicketByID(15L);
AccountService accountService = new AccountService();
Account account = accountService.getAccountByUsername("pirooz").get(0);
account.getTickets().remove(ticket);



        Trip trip = new Trip();
        TripService tripService = new TripService();
        Date date = new Date();
//        int hour = (int)(date.getTime() % 86400000) / 3600000;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("hh:mm");
        SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy/MM/dd");
        date.setHours(18);
        date.setMinutes(45);
        date.setDate(30);
        date.setMonth(8);
        date.setYear(99-600);
        System.out.println(date.getTime());
        System.out.println(simpleDateFormat.format(date));
        System.out.println(simpleDateFormat2.format(date));
//        System.out.println(date);

        trip.setOrigin("شاهرود");
        trip.setDestination("آمل");
        trip.setStartDate(date);
        tripService.generateTrip(trip);
        System.out.println("=======================");
        String test = "lkk";
        Long id = Long.valueOf(test);
        System.out.println(id);
        System.out.println("--------------------------");
        System.out.println(simpleDateFormat2.format(trip.getStartDate()));
        for (Trip trip1:tripService.getAllOfTrips()){
            /*if ((trip1.getOrigin()=="تهران")&&(trip1.getDestination()=="اصفهان")){
                System.out.println(trip1.getStartDate());
            }
            else{
                System.out.println("?????");
            }*/

            System.out.println();
        }

    }
}
