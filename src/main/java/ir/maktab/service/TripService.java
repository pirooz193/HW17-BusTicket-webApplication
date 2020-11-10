package ir.maktab.service;

import ir.maktab.domains.Trip;
import ir.maktab.repository.impl.TripRepositoryImpl;

import java.util.List;

public class TripService {

    TripRepositoryImpl tripRepository = TripRepositoryImpl.getInstance();


    public Trip generateTrip(Trip trip){
        return tripRepository.save(trip);
    }

    public List<Trip> getAllOfTrips(){
        return tripRepository.getAllTrips();
    }
    public List<Trip> getTripByOriginAndDestionation(String origin,String destination){
        return tripRepository.getTripByOriginAndDestination(origin,destination);
    }

    public Trip getTripById(Long id){
        return tripRepository.load(id);
    }
}
