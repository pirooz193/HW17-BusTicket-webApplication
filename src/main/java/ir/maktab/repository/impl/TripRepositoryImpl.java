package ir.maktab.repository.impl;

import ir.maktab.domains.Trip;
import ir.maktab.repository.base.BaseRepository;

import java.util.Date;
import java.util.List;

public class TripRepositoryImpl extends BaseRepository<Trip, Long> {

    private static TripRepositoryImpl tripRepository;

    public static TripRepositoryImpl getInstance() {
        if (tripRepository == null) tripRepository = new TripRepositoryImpl();
        return tripRepository;
    }
    public List<Trip> getTripByOriginAndDestination(String origin, String destination){
        return  entityManager
                .createQuery("from Trip where origin=:origin and destination=:destination",getEntityClass())
                .setParameter("origin",origin)
                .setParameter("destination" ,destination)
                .getResultList();
    }

    public List<Trip> getTrips(String origin, String destination, Date date) {
        return entityManager
                .createQuery("from Trip where origin=:origin and destination=:destination and startDate=:date", getEntityClass())
                .setParameter("origin", origin)
                .setParameter("destination", destination)
                .setParameter("date",date)
                .getResultList();
    }
    public List<Trip> getAllTrips (){
        return tripRepository.loadAll();
    }

    @Override
    protected Class<Trip> getEntityClass() {
        return Trip.class;
    }


}
