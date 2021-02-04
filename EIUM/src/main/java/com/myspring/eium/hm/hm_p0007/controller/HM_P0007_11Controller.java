package com.myspring.eium.hm.hm_p0007.controller;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface HM_P0007_11Controller {
	public Map searchTraining(HttpServletRequest request, HttpServletResponse response) throws Exception;  
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;

}