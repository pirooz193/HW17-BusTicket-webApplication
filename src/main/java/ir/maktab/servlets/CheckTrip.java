package ir.maktab.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/checkTrip")
public class CheckTrip extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String origin = req.getParameter("origin");
        String destination = req.getParameter("destination");
        Date date = (Date) req.getPart("date");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
    }
}
