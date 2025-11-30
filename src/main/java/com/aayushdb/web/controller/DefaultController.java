/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aayushdb.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aayushdb.web.entity.Patient;
import com.aayushdb.web.service.PatientService;

/**
 *
 * @author dell
 */
@Controller
@RequestMapping(value = "/home")
public class DefaultController {

    private final PatientService patientService;

    @Autowired
    public DefaultController(PatientService patientService) {
        this.patientService = patientService;
    }

    /* @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        // Delegation: Controller asks Service for the data
        List<Patient> patients = patientService.getHomepagePatients();
        model.addAttribute("patients", patients);
        return "/index";
    } */

    /* @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    @ResponseBody
    public String edit(@PathVariable("id") int id) {
        // Delegation: Controller asks Service for the specific patient
        Patient patient = patientService.getPatientById(id);
        
        if (patient == null) {
            // Error handling logic would be better here (e.g., throw a ResourceNotFoundException)
            return "Patient not found";
        }
        return patient.getFirstName() + " " + patient.getLastName();
    } */
}