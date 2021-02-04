package com.myspring.eium.hm.hm_p0033.controller;


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

import com.myspring.eium.hm.hm_p0033.service.HM_P0033Service;
import com.myspring.eium.hm.hm_p0033.vo.HM_P0033VO;
import com.myspring.eium.login.vo.LoginVO;




@Controller
public class HM_P0033ControllerImpl implements HM_P0033Controller {
	private static final Logger logger = LoggerFactory.getLogger(HM_P0033ControllerImpl.class);
	String x=null;
	String y=null;
	Map<String, Object> dateMap = new HashMap<String, Object>();
	@Autowired
	HM_P0033Service p0033Service;
	
	@Override
	@RequestMapping(value = "/hm/p0033/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0033/p0033_tab");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0033/searchInit2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0033/p0033");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0033/searchInit3.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit3(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0033/p0033-2");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0033/searchHrassessment.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchHrassessment(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ModelAndView mav = new ModelAndView("hm/hm_p0033/p0033_SearchHrassessment");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0033/searchHrrnp.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchHrrnp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ModelAndView mav = new ModelAndView("hm/hm_p0033/p0033_SearchHrrnp");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0033/searchSite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchSite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ModelAndView mav = new ModelAndView("hm/hm_p0033/p0033_SearchSite");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0033/searchEmployeename.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchEmployeename(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ModelAndView mav = new ModelAndView("hm/hm_p0033/p0033_SearchEmployee");
	
		return mav;
	} 
	
	
	@Override
	@RequestMapping(value = "/hm/p0033/hr_assessment_List.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map hr_assessment_List(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		List<HM_P0033VO> data = p0033Service.hr_assessment_List(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0033/hr_rnp_List.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map hr_rnp_List(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		List<HM_P0033VO> data = p0033Service.hr_rnp_List(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}
	
	
	@Override
	@RequestMapping(value = "/hm/p0033/site_List.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map site_List(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		List<HM_P0033VO> data = p0033Service.site_List(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}
	
	
	@Override
	@RequestMapping(value = "/hm/p0033/employee_List.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map employee_List(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		List<HM_P0033VO> data = p0033Service.employee_List(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}
	
	
	
	
	@Override
	@RequestMapping(value = "/hm/p0033/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
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
		
		int n =  (Integer) accessMap.get("M017");
		System.out.println(accessRange.get(n));
		System.out.println("사원코드"+loginvo.getEmployee_code());
		System.out.println("부서코드"+loginvo.getDepartment_code());
		
		searchMap.put("access_range", accessRange.get(n));
		searchMap.put("Semployee_code",loginvo.getEmployee_code());
		searchMap.put("Sdepartment_code", loginvo.getDepartment_code());
		
		searchMap.put("hr_assessment_code", request.getParameter("Phr_assessment_code"));
		searchMap.put("site_code", request.getParameter("Psite_code"));
		searchMap.put("employee_code", request.getParameter("Pemployee_code"));
		searchMap.put("date", request.getParameter("date"));
		searchMap.put("date2", request.getParameter("date2"));



		System.out.println(request.getParameter("Phr_assessment_code"));
		System.out.println(request.getParameter("Psite_code"));
		System.out.println(request.getParameter("Pemployee_code"));
		System.out.println(request.getParameter("date"));
		System.out.println(request.getParameter("date2"));


		List<HM_P0033VO> data = p0033Service.searchList(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}
	
	
	@Override
	@RequestMapping(value = "/hm/p0033/searchList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		
		int n =  (Integer) accessMap.get("M017");
		System.out.println(accessRange.get(n));
		System.out.println("사원코드"+loginvo.getEmployee_code());
		System.out.println("부서코드"+loginvo.getDepartment_code());
		
		searchMap.put("access_range", accessRange.get(n));
		searchMap.put("Semployee_code",loginvo.getEmployee_code());
		searchMap.put("Sdepartment_code", loginvo.getDepartment_code());
		searchMap.put("hr_rnp_code", request.getParameter("Phr_rnp_code"));
		searchMap.put("site_code", request.getParameter("Psite_code"));
		searchMap.put("employee_code", request.getParameter("Pemployee_code"));
		searchMap.put("date", request.getParameter("date"));
		searchMap.put("date2", request.getParameter("date2"));


		System.out.println(request.getParameter("Phr_rnp_code"));
		System.out.println(request.getParameter("Psite_code"));
		System.out.println(request.getParameter("Pemployee_code"));
		System.out.println(request.getParameter("date"));
		System.out.println(request.getParameter("date2"));


		List<HM_P0033VO> data = p0033Service.searchList2(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}
	
	

	

	

	

	
	

	

}
