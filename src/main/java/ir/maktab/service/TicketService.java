package ir.maktab.service;

import ir.maktab.domains.Ticket;
import ir.maktab.domains.Trip;
import ir.maktab.repository.impl.TicketRepositoryImpl;

import java.util.List;

public class TicketService {

    TicketRepositoryImpl ticketRepository = TicketRepositoryImpl.getInstance();
    public Ticket generateTicket(Ticket ticket){
       return ticketRepository.save(ticket);
    }

    public List<Ticket> getTicketByTripId(Trip trip){
        return ticketRepository.getTicketByTrip(trip);
    }
    public Ticket getTicketByID(Long id){
        return ticketRepository.load(id);
    }
    public void deleteTicket(Ticket ticket){
        ticketRepository.delete(ticket);
    }
}
