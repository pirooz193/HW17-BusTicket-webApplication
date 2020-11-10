package ir.maktab.domains;

import ir.maktab.baseEntity.BaseEntity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import java.sql.Time;
import java.util.Date;

@Entity
public class Ticket extends BaseEntity {



    private Date startDate;
    private String origin;
    private String destination;

    @ManyToOne
    private Account account = new Account();
    @ManyToOne
    private Trip trip = new Trip();


    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Trip getTrip() {
        return trip;
    }

    public void setTrip(Trip trip) {
        this.trip = trip;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public Account getPerson() {
        return account;
    }

    public void setPerson(Account account) {
        this.account = account;
    }
}
