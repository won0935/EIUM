package com.myspring.eium.hm.hm_p0040.controller;



import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface HM_P0040Controller {

	ModelAndView tabInit(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView EduInit(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView EdutargetInit(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView siteSearch_p01(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView departmentSearch_p01(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map searchEmployee(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map searchTraining(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map searchEmployeeList(HttpServletRequest request, HttpServletResponse response) throws Exception;



}
