package com.myspring.eium.login.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.eium.login.vo.LoginVO;

public interface LoginController {
	//public ModelAndView login(LoginVO login, RedirectAttributes rAttr, HttpServletRequest request,
	//		HttpServletResponse response) throws Exception;
	/*
	 * public ModelAndView Loginform(HttpServletRequest request, HttpServletResponse
	 * response) throws Exception;
	 */

	ModelAndView appointList(LoginVO login, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
