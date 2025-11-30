/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aayushdb.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author dell
 */
@Controller
@RequestMapping(value="/admin/dashboard")
public class DashboardController {  

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("contentPage", "/WEB-INF/views/admin/dashboard/home.jsp");
        return "/admin/dashboard/index";
    }
}

