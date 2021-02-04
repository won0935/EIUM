package com.myspring.eium.hm.hm_p0002.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;


public interface HM_P0002Controller {
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchSelect(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map saveSelect(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView siteSerch_init(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map siteSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView jobclassSerch_init(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map jobclassSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
