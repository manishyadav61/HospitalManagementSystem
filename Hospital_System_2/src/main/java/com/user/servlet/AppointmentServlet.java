package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.AppointmentDAO;
import com.db.DBConnect;
import com.entity.Appointment;

@WebServlet("/add_appoint")
public class AppointmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int userId = Integer.parseInt(req.getParameter("user_id"));
            String fullname = req.getParameter("fullname");
            String gender = req.getParameter("gender");
            String age = req.getParameter("age");
            String appoint_date = req.getParameter("appoint_date");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String diseases = req.getParameter("diseases");
            int doctor_id = Integer.parseInt(req.getParameter("doctor_id"));
            String address = req.getParameter("address");

            if (fullname == null || gender == null || age == null || appoint_date == null || email == null || phno == null || diseases == null || address == null) {
                throw new IllegalArgumentException("Missing form data");
            }

            Appointment ap = new Appointment(userId, fullname, gender, age, appoint_date, email, phno, diseases, doctor_id, address, "Pending");

            AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.addAppointment(ap)) {
                session.setAttribute("succMsg", "Appointment Successfully");
                resp.sendRedirect("user_appointment.jsp");
            } else {
                session.setAttribute("errorMsg", "Something went wrong on the server");
                resp.sendRedirect("user_appointment.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("errorMsg", "Invalid data provided: " + e.getMessage());
            resp.sendRedirect("user_appointment.jsp");
        }
    }
}
