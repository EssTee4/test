package com.aayushdb.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aayushdb.web.dao.MailTemplateDAO;
import com.aayushdb.web.entity.MailTemplate;
import com.aayushdb.web.service.MailTemplateService;

@Service
public class MailTemplateServiceImpl extends GenericServiceImpl<MailTemplate> implements MailTemplateService {
    @Autowired private MailTemplateDAO mailTemplateDAO;

    public MailTemplateServiceImpl() {
        super(null);
    }

    @Override
    public List<MailTemplate> getAll() {
        return mailTemplateDAO.getAll();
    }

    @Override
    public void save(MailTemplate mailTemplate) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public MailTemplate getById(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
