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

import com.aayushdb.web.service.MailTemplateService;
import com.aayushdb.web.entity.MailTemplate;


/**
 *
 * @author dell
 */
@Controller
@RequestMapping(value="/admin/mailtemplates")
public class MailTemplateController {
    private final MailTemplateService mailTemplateService;
    @Autowired
    public MailTemplateController(MailTemplateService mailTemplateService) {
        this.mailTemplateService = mailTemplateService;
    }
    
    @RequestMapping(method=RequestMethod.GET)
    public String index(Model model){
        model.addAttribute("mailTemplates",mailTemplateService.getAll());
        return "admin/mailtemplates/index";
        
    }
    
    @RequestMapping(value="/add",method=RequestMethod.GET)
    public String add(){
        return "admin/mailtemplates/add";
        
    }
    
    @RequestMapping(value="/save",method=RequestMethod.POST)
    public String save(@ModelAttribute("MailTemplate") MailTemplate mailTemplate){
        mailTemplateService.save(mailTemplate);
        return "redirect:/admin/mailtemplates";
        
    }
    
    @RequestMapping(value="/edit/{id}",method=RequestMethod.GET)
    public String edit(@PathVariable("id") int id,Model model){
        model.addAttribute("mailTemplate", mailTemplateService.getById(id));
        return "admin/mailtemplates/edit";
        
    }
}
