package com.aayushdb.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aayushdb.web.dao.PatientDAO;
import com.aayushdb.web.entity.Patient;
import com.aayushdb.web.service.PatientService;

@Service
public class PatientServiceImpl extends GenericServiceImpl<Patient> implements PatientService {
    @Autowired private PatientDAO patientDAO;

    public PatientServiceImpl() {
        super(null);
    }

    @Override
    public List<Patient> getAll() {
        return patientDAO.getAll();
    }

    @Override
    public Patient getById(int patientId) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void save(Patient patient) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public Patient getPatientById(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public List<Patient> getHomepagePatients() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
