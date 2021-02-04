package com.myspring.eium.sm.sm_p0001.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface SM_P0001Controller {
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	/*
	 * public String searchList2(HttpServletRequest request, HttpServletResponse
	 * response) throws Exception;
	 */
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView findAddress(HttpServletRequest request, HttpServletResponse response) throws Exception;
}