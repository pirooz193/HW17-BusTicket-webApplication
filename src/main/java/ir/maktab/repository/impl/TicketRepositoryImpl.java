package ir.maktab.repository.impl;

import ir.maktab.domains.Ticket;
import ir.maktab.domains.Trip;
import ir.maktab.repository.base.BaseRepository;

import java.util.List;

public class TicketRepositoryImpl extends BaseRepository<Ticket,Long> {

    private static TicketRepositoryImpl ticketRepository;
    public static TicketRepositoryImpl getInstance(){
        if (ticketRepository == null) ticketRepository = new TicketRepositoryImpl();
        return ticketRepository;
    }

    public List<Ticket> getTicketByTrip(Trip trip){
        return  entityManager
                .createQuery("from Ticket where trip=:trip",getEntityClass())
                .setParameter("trip",trip)
                .getResultList();
    }
    @Override
    protected Class<Ticket> getEntityClass() {
        return Ticket.class;
    }

    public Ticket saveTicket(Ticket ticket){
      return   save(ticket);
    }


}
