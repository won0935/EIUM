package com.myspring.eium.hm.hm_p0033.controller;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface HM_P0033Controller {
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchInit2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchInit3(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchHrassessment(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchHrrnp(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchSite(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchEmployeename(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map hr_assessment_List(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map hr_rnp_List(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map site_List(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map employee_List(HttpServletRequest request, HttpServletResponse response) throws Exception;

}