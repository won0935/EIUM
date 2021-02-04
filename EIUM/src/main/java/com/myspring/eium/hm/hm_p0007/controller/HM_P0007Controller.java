package com.myspring.eium.hm.hm_p0007.controller;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.eium.hm.hm_p0007.vo.HM_P0007VO;

public interface HM_P0007Controller {
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView license_Popup(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView assessment_Popup(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView rnp_Popup(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView language_Popup(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map license_List(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map assessment_List(HttpServletRequest request, HttpServletResponse response) throws Exception;	
	public Map rnp_List(HttpServletRequest request, HttpServletResponse response) throws Exception;	
	public Map language_List(HttpServletRequest request, HttpServletResponse response) throws Exception;	
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;	

	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;

}