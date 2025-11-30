/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aayushdb.web.dao.impl;

import org.springframework.stereotype.Repository;

import com.aayushdb.web.dao.DoctorDAO;
import com.aayushdb.web.entity.Doctor;

/**
 *
 * @author dell
 */
@Repository(value="doctorDAO")
public class DoctorDAOImpl extends GenericDAOImpl<Doctor> implements DoctorDAO{
    
    
}
