package ir.maktab.test;

import ir.maktab.domains.Trip;
import ir.maktab.service.TripService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/test.simple")
//@WebFilter("")
public class TestServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/html");


        TripService tripService = new TripService();

        String origin = req.getParameter("origin");
        String destination = req.getParameter("destination");

        for(Trip trip1:tripService.getTripByOriginAndDestionation(origin,destination)){
           out.println(trip1.getOrigin());
           out.println(trip1.getStartDate());
       }

        out.println("pirooz");
        out.println(origin);
        out.println(destination);
    }
}
