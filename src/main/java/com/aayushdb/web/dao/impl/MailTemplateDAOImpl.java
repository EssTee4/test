/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aayushdb.web.dao.impl;

import org.springframework.stereotype.Repository;

import com.aayushdb.web.dao.MailTemplateDAO;
import com.aayushdb.web.entity.MailTemplate;

/**
 *
 * @author dell
 */
@Repository(value="mailTemplateDAO")
public class MailTemplateDAOImpl
        extends GenericDAOImpl<MailTemplate>
        implements MailTemplateDAO {

}
