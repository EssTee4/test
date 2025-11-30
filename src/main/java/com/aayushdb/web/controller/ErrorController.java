package com.aayushdb.web.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        
        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());
            model.addAttribute("errorCode", statusCode);

            switch (statusCode) {
                case 404:
                    model.addAttribute("errorMessage", "Page Not Found");
                    return "error/404";
                case 500:
                    model.addAttribute("errorMessage", "Internal Server Error");
                    return "error/500";
                case 403:
                    model.addAttribute("errorMessage", "Access Denied");
                    return "error/generic-error";
                case 400:
                    model.addAttribute("errorMessage", "Bad Request");
                    return "error/generic-error";
                default:
                    break;
            }
        }

        model.addAttribute("errorMessage", "Unexpected error occurred.");
        return "error/generic-error";
    }
}

