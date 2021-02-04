package com.myspring.eium.wm.wm_p0001.controller;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface WM_P0001Controller {
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map EMP_searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map WS_searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map TWS_searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map SUM_saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map TWS_saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map WS_YN_rollbackData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	/*
	 * public Map WS_YN_updateData(HttpServletRequest request, HttpServletResponse
	 * response) throws Exception;
	 */
}