/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aayushdb.web.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aayushdb.web.entity.Patient;
import com.aayushdb.web.entity.Treatment;
import com.aayushdb.web.service.PatientService;
import com.aayushdb.web.service.TreatmentService;

/**
 *
 * @author dell
 */
@Controller
@RequestMapping(value="/admin/patients")
public class PatientController {
    private final PatientService patientService;
    private final TreatmentService treatmentService;

    @Autowired
    public PatientController(PatientService patientService, TreatmentService treatmentService) {
        this.patientService = patientService;
        this.treatmentService = treatmentService;
    }

    @RequestMapping(value = {"", "/", "/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("patients", patientService.getAll());
        model.addAttribute("contentPage", "/WEB-INF/views/admin/patients/index.jsp");
        model.addAttribute("formPage", "/WEB-INF/views/admin/patients/form.jsp");
        return "admin/dashboard/index";
    }
    
    /* @RequestMapping(value="/add", method=RequestMethod.GET)
    public String add(Model model){
        model.addAttribute("patient", new Patient());
        model.addAttribute("contentPage", "/WEB-INF/views/admin/patients/form.jsp");
        return "admin/dashboard/index";
    } */
    
    @RequestMapping(value="/save", method=RequestMethod.POST)
    public String save(@ModelAttribute("Patient") Patient patient, @RequestParam(name="refresh", required = false) String refresh){
        patientService.save(patient);
        String redirect="/admin/patients";
        if(refresh!=null &&refresh.equals("1")){
            redirect="/admin/patients/add";
        }
        return "redirect:" + redirect;        
    }
    
    @ResponseBody
    @RequestMapping(value = "/{id}/json", method = RequestMethod.GET)
    public Patient getPatientJson(@PathVariable("id") int id) {
        return patientService.getById(id);
    }

    @RequestMapping(value="/addTreatment", method=RequestMethod.POST)
    @ResponseBody
    public String addTreatment(@ModelAttribute("Treatment") Treatment treatment){
        treatmentService.save(treatment);
        return "success";
    }
  
}
