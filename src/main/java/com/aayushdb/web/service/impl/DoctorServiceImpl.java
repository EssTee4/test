package com.aayushdb.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aayushdb.web.dao.DoctorDAO;
import com.aayushdb.web.entity.Doctor;
import com.aayushdb.web.service.DoctorService;

@Service
public class DoctorServiceImpl extends GenericServiceImpl<Doctor> implements DoctorService {
    @Autowired private DoctorDAO doctorDAO;

    public DoctorServiceImpl() {
        super(null);
    }

    @Override
    public List<Doctor> getAll() {
        return doctorDAO.getAll();
    }

    @Override
    public Doctor getById(int doctorId) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void save(Doctor doctor) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
