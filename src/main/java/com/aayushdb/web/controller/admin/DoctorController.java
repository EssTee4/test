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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aayushdb.web.entity.Doctor;
import com.aayushdb.web.service.DoctorService;

/**
 *
 * @author dell
 */
@Controller
@RequestMapping(value="/admin/doctors")
public class DoctorController {
    private final DoctorService doctorService;

    @Autowired
    public DoctorController(DoctorService doctorService) {
        this.doctorService = doctorService;
    }
    
    @RequestMapping(value = {"", "/", "/index"}, method = RequestMethod.GET)
    public String index(Model model){
        model.addAttribute("doctors", doctorService.getAll());
        model.addAttribute("contentPage", "/WEB-INF/views/admin/doctors/index.jsp");
        model.addAttribute("formPage", "/WEB-INF/views/admin/doctors/form.jsp");
        return "/admin/dashboard/index";
    }

    /* @RequestMapping(value="/add", method=RequestMethod.GET)
    public String add(Model model){
        model.addAttribute("contentPage", "/WEB-INF/views/admin/doctors/add.jsp");
        return "admin/dashboard/index";
    } */
    
    @RequestMapping(value="/save", method=RequestMethod.POST)
    public String save(@ModelAttribute("Doctor") Doctor doctor, @RequestParam(name="refresh", required = false) String refresh){
        doctorService.save(doctor);
        String redirect="/admin/doctors";
        if(refresh!=null &&refresh.equals("1")){
            redirect="/admin/doctors/add";
        }
        return "redirect:" + redirect;        
    }
    
    /* @RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
    public String edit(@PathVariable("id") int id,Model model){
        model.addAttribute("doctor", doctorService.getById(id));
        model.addAttribute("contentPage", "/WEB-INF/views/admin/doctors/edit.jsp");
        return "admin/dashboard/index";        
    } */
}
