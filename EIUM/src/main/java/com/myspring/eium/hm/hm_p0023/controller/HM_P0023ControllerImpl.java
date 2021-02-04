package com.myspring.eium.hm.hm_p0023.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.eium.hm.hm_p0023.service.HM_P0023Service;
import com.myspring.eium.hm.hm_p0023.vo.HM_P0023VO;
import com.myspring.eium.login.vo.LoginVO;

@Controller
public class HM_P0023ControllerImpl implements HM_P0023Controller{
	@Autowired
	HM_P0023Service hM_P0023Service;
	
	@Autowired
	HM_P0023VO hM_P0023VO;
	
	@Override
	@RequestMapping(value = "hm/p0023/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView homeInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0023/p0023_home");
	
		return mav;

	}
	@Override
	@RequestMapping(value = "hm/p0023/departmentSearch_p01.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView departmentSearch_p01(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0023/departmentSearch_p01");
	
		return mav;
	}
	@Override
	@RequestMapping(value = "hm/p0023/employeeSearch_p02.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView employeeSearch_p02(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0023/employeeSearch_p02");
	
		return mav;
	
	}
	
	
	@Override
	@RequestMapping(value = "/hm/p0023/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map appointList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		HttpSession session = request.getSession(); 
		LoginVO loginvo = new LoginVO();
		loginvo = (LoginVO)session.getAttribute("login"); 
		
		Map<String, Object> accessMap = new HashMap<String, Object>();
		ArrayList<String> accessRange = new ArrayList<String>();		
		accessRange = (ArrayList<String>) session.getAttribute("access_range"); 
		accessMap = (Map<String, Object>) session.getAttribute("accessnum");	
		
		int n =  (Integer) accessMap.get("M015");
		
		searchMap.put("access_range", accessRange.get(n));
		searchMap.put("Semployee_code",loginvo.getEmployee_code());
		searchMap.put("Sdepartment_code", loginvo.getDepartment_code());
		
		searchMap.put("date", request.getParameter("date"));
		searchMap.put("date2", request.getParameter("date2"));
		searchMap.put("appoint_index", request.getParameter("appoint_index"));
		searchMap.put("employee", request.getParameter("employee"));
		searchMap.put("department", request.getParameter("department"));
		
		List<HM_P0023VO> data = hM_P0023Service.appointList(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	
}
	
	
	

