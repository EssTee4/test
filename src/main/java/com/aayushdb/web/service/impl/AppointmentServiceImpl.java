package com.aayushdb.web.service.impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aayushdb.web.dao.AppointmentDAO;
import com.aayushdb.web.entity.Appointment;
import com.aayushdb.web.service.AppointmentService;

@Service
public class AppointmentServiceImpl extends GenericServiceImpl<Appointment> implements AppointmentService {
    @Autowired private AppointmentDAO appointmentDAO;

    public AppointmentServiceImpl() {
        super(null);
    }

    @Override
    public List<Appointment> getAll() {
        return appointmentDAO.getAll();
    }

    public List<Appointment> findAppointments(Integer doctorId, LocalDate date) {
        throw new UnsupportedOperationException("Unimplemented method 'findAppointments'");
    }

    @Override
    public void save(Appointment appointment) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Appointment getById(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
