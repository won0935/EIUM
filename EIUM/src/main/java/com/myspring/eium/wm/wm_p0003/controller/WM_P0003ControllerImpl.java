package com.myspring.eium.wm.wm_p0003.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.eium.wm.wm_p0003.vo.WM_P0003VO;
import com.myspring.eium.login.vo.LoginVO;
import com.myspring.eium.wm.wm_p0003.service.WM_P0003ServiceImpl;



@Controller
public class WM_P0003ControllerImpl implements WM_P0003Controller{
	private static final Logger logger = LoggerFactory.getLogger(WM_P0003ControllerImpl.class);
	
	@Autowired
	WM_P0003ServiceImpl WM_P0003Service;
	@Autowired
	WM_P0003VO WM_P0003VO;
	
	@Override
	@RequestMapping(value = "/wm/p0003/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("wm/wm_p0003/p0003");
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/wm/p0003/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		HttpSession session = request.getSession(); 
		LoginVO loginvo = new LoginVO();
		loginvo = (LoginVO)session.getAttribute("login"); 
		
		Map<String, Object> accessMap = new HashMap<String, Object>();
		ArrayList<String> accessRange = new ArrayList<String>();		
		accessRange = (ArrayList<String>) session.getAttribute("access_range"); 
		accessMap = (Map<String, Object>) session.getAttribute("accessnum");	
		
		int n =  (Integer) accessMap.get("M030");
		System.out.println(accessRange.get(n));
		System.out.println("사원코드"+loginvo.getEmployee_code());
		System.out.println("부서코드"+loginvo.getDepartment_code());
		
		searchMap.put("access_range", accessRange.get(n));
		searchMap.put("Semployee_code",loginvo.getEmployee_code());
		searchMap.put("Sdepartment_code", loginvo.getDepartment_code());
		searchMap.put("date", request.getParameter("date"));
		searchMap.put("date2", request.getParameter("date2"));
		searchMap.put("vacaTYPE", request.getParameter("vacaTYPE"));
		searchMap.put("SiteList", request.getParameter("SiteList"));
		searchMap.put("DeptList", request.getParameter("DeptList"));
		searchMap.put("Employee_Select", request.getParameter("Employee_Select"));
		searchMap.put("p_text", request.getParameter("p_text"));
		
		List<WM_P0003VO> data = WM_P0003Service.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	
}
