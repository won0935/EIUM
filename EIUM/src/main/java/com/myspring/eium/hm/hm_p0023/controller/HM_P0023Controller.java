package com.myspring.eium.hm.hm_p0023.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface HM_P0023Controller {

	ModelAndView homeInit(HttpServletRequest request, HttpServletResponse response) throws Exception;


	ModelAndView departmentSearch_p01(HttpServletRequest request, HttpServletResponse response) throws Exception;


	ModelAndView employeeSearch_p02(HttpServletRequest request, HttpServletResponse response) throws Exception;


	Map appointList(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
