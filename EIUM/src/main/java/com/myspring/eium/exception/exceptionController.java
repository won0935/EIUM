package com.myspring.eium.exception;


import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class exceptionController {
	
	@ExceptionHandler(Exception.class)
	public ModelAndView exception(Exception e){
		ModelAndView mav = new ModelAndView("exception");
        mav.addObject("name", e.getClass().getSimpleName());

        mav.addObject("message", e.getMessage());
        mav.setViewName("exception");

        return mav;
 
	}

}
