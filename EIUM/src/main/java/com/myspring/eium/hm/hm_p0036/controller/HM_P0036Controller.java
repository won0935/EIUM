package com.myspring.eium.hm.hm_p0036.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface HM_P0036Controller {

	ModelAndView tabInit(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView tabInit2(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView job_class_p01(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView position_p02(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView duty_p03(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView job_dis_p04(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView work_type_p05(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView pay_type_p06(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map searchList_p01(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map searchList_p02(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map searchList_p03(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map searchList_p04(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map searchList_p05(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map searchList_p06(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView tabInit3(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView tabInit4(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map searchList3(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
