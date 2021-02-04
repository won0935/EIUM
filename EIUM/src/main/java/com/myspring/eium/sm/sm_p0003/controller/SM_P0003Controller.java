package com.myspring.eium.sm.sm_p0003.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.eium.sm.sm_p0003.vo.SM_P0003VO;


public interface SM_P0003Controller {
	public ModelAndView popup(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchpopup(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map saveDataPopup(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchSiteList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView sectorSerch_init(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map sectorSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView siteSerch_init(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map siteSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView siteSearchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
