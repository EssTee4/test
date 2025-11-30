/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aayushdb.web.controller.admin;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author dell
 */
@Controller
@RequestMapping(value = "/admin/logout")
public class LogoutController {

    @RequestMapping(method=RequestMethod.GET)
    public String index(HttpServletRequest request, RedirectAttributes redirectAttributes){
        request.getSession().invalidate();
        redirectAttributes.addAttribute("logout", "true");
        return "redirect:/login";
    }
    
}
