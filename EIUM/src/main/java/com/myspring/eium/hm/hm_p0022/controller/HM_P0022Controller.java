package com.myspring.eium.hm.hm_p0022.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface HM_P0022Controller {

	ModelAndView homeInit(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map appointList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map appointSearch_p01(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map saveData1(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map masterEmployee_p02(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map homeEmployeeSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map homeSearch_p03(HttpServletRequest request, HttpServletResponse response) throws Exception;


	Map saveData2(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView homeInit_p01(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView homeInit_p02(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView homeInit_p03(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView homeInit_p04(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map homeSearch_p04(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView homeInit_p05(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map homeSearch_p05(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map saveData3(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map saveData4(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map appointSearch_p02(HttpServletRequest request, HttpServletResponse response) throws Exception;




}
