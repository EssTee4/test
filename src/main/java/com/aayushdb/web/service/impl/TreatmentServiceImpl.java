package com.aayushdb.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aayushdb.web.dao.TreatmentDAO;
import com.aayushdb.web.entity.Treatment;
import com.aayushdb.web.service.TreatmentService;

@Service
public class TreatmentServiceImpl extends GenericServiceImpl<Treatment> implements TreatmentService {
    @Autowired private TreatmentDAO treatmentDAO;

    public TreatmentServiceImpl() {
        super(null);

    }

    @Override
    public List<Treatment> getAll() {
        return treatmentDAO.getAll();
    }

    @Override
    public void save(Treatment treatment) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Treatment getById(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
