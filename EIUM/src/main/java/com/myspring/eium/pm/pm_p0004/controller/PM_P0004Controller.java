package com.myspring.eium.pm.pm_p0004.controller;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface PM_P0004Controller {
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map payment_searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchTypeList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map bankList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchReceipt(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map paygrade_searchData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView paymentdateSerch_init(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView paygrade_Search(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
}