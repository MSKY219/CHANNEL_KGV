package com.kh.kgv.helpDesk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.MissingRequestHeaderException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
@SessionAttributes({"loginUser"})
public class HelpDeskExceptionHandler {
	

	

	
	  @ExceptionHandler(MissingRequestHeaderException.class)
	    public ModelAndView handleMissingRequestHeaderException(MissingRequestHeaderException ex, HttpServletRequest request) {
	        ModelAndView modelAndView = new ModelAndView();
	        modelAndView.addObject("exception", ex);
	        modelAndView.addObject("url", request.getRequestURL());
	        modelAndView.setViewName("/helpDesk/error"); 
	        return modelAndView;
	    }
	  
	  @ExceptionHandler(NullPointerException.class)
	  public ModelAndView handleNullPointerException(NullPointerException ex, HttpServletRequest request) {
	      ModelAndView modelAndView = new ModelAndView();
	      modelAndView.addObject("exception", ex);
	      modelAndView.addObject("url", request.getRequestURL());
	      modelAndView.setViewName("/helpDesk/error");  
	      return modelAndView;
	  }
	  
	  @ExceptionHandler(HttpSessionRequiredException.class)
	    public ModelAndView handleHttpSessionRequiredException(HttpSessionRequiredException ex, HttpServletRequest request) {
	        ModelAndView modelAndView = new ModelAndView();
	        modelAndView.addObject("exception", ex);
	        modelAndView.addObject("url", request.getRequestURL());
	        modelAndView.setViewName("/helpDesk/error");  
	        return modelAndView;
	
	  }

}
