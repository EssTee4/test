package com.aayushdb.web.handler;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalExceptionHandler {

    // Handle 404 errors (Page Not Found)
    @ExceptionHandler(NoHandlerFoundException.class)
    public ModelAndView handle404(NoHandlerFoundException ex, Model model) {
        ModelAndView modelAndView = new ModelAndView("error/404");
        modelAndView.addObject("errorMessage", "Page Not Found");
        return modelAndView;
    }

    // Handle 500 errors (Internal Server Error)
    @ExceptionHandler(Exception.class)
    public ModelAndView handle500(Exception ex) {
        ModelAndView modelAndView = new ModelAndView("error/500");
        modelAndView.addObject("errorMessage", "An unexpected error occurred.");
        modelAndView.addObject("stackTrace", ex.getStackTrace());
        return modelAndView;
    }
}
    