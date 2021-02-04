package com.myspring.eium.hm.hm_p0040.controller;

import java.util.ArrayList;
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

import com.myspring.eium.hm.hm_p0040.service.HM_P0040Service;
import com.myspring.eium.hm.hm_p0040.vo.HM_P0040VO;
import com.myspring.eium.login.vo.LoginVO;


@Controller
public class HM_P0040ControllerImpl implements HM_P0040Controller{
	private static final Logger logger = LoggerFactory.getLogger(HM_P0040ControllerImpl.class);
	
	@Autowired
	HM_P0040Service hM_P0040Service;
	
	@Autowired
	HM_P0040VO hM_P0040VO;
	
	@Override
	@RequestMapping(value = "hm/p0040/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView tabInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0040/p0040_tab");
	
		return mav;
	}

	@Override
	@RequestMapping(value = "hm/p0040/searchInit2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView EduInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0040/p0040_home1");
	
		return mav;
	} 
	@Override
	@RequestMapping(value = "hm/p0040/searchInit3.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView EdutargetInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0040/p0040_home2");
	
		return mav;
	} 

	@Override
	@RequestMapping(value = "hm/p0040/siteSearch_p01.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView siteSearch_p01(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0040/siteSearch_p01");
	
		return mav;
	} 
	@Override
	@RequestMapping(value = "hm/p0040/departmentSearch_p02.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView departmentSearch_p01(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0040/departmentSearch_p02");
	
		return mav;
	} 
	
	
	
	
	
	
	
	
	
	
	@Override
	@RequestMapping(value = "/hm/p0040/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		
		int n =  (Integer) accessMap.get("M021");
		System.out.println(accessRange.get(n));
		System.out.println("사원코드"+loginvo.getEmployee_code());
		System.out.println("부서코드"+loginvo.getDepartment_code());
		
		searchMap.put("access_range", accessRange.get(n));
		searchMap.put("Semployee_code",loginvo.getEmployee_code());
		searchMap.put("Sdepartment_code", loginvo.getDepartment_code());
		
		searchMap.put("date", request.getParameter("date"));
		searchMap.put("date2", request.getParameter("date2"));
		searchMap.put("site", request.getParameter("site"));
		searchMap.put("department", request.getParameter("department"));


		List<HM_P0040VO> data = hM_P0040Service.searchList(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0040/searchEmployee.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchEmployee(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		searchMap.put("param", request.getParameter("param"));



		List<HM_P0040VO> data = hM_P0040Service.searchEmployee(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0040/searchTraining.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchTraining(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		searchMap.put("date", request.getParameter("date"));
		searchMap.put("date2", request.getParameter("date2"));
		searchMap.put("site", request.getParameter("site"));
		searchMap.put("department", request.getParameter("department"));


		List<HM_P0040VO> data = hM_P0040Service.searchTraining(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0040/searchEmployeeList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchEmployeeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		searchMap.put("param", request.getParameter("param"));



		List<HM_P0040VO> data = hM_P0040Service.searchEmployeeList(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}

}
