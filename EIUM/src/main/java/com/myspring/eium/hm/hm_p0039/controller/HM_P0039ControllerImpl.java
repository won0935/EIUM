package com.myspring.eium.hm.hm_p0039.controller;

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

import com.myspring.eium.hm.hm_p0039.service.HM_P0039Service;
import com.myspring.eium.hm.hm_p0039.vo.HM_P0039VO;
import com.myspring.eium.login.vo.LoginVO;



@Controller
public class HM_P0039ControllerImpl implements HM_P0039Controller{

	@Autowired
	HM_P0039Service hM_P0039Service;
	
	@Autowired
	HM_P0039VO hM_P0039VO;
	
	@Override
	@RequestMapping(value = "/hm/p0039/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0039/p0039");
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0039/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
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
		
		int n =  (Integer) accessMap.get("M020");
		System.out.println(accessRange.get(n));
		System.out.println("사원코드"+loginvo.getEmployee_code());
		System.out.println("부서코드"+loginvo.getDepartment_code());
		
		searchMap.put("access_range", accessRange.get(n));
		searchMap.put("Semployee_code",loginvo.getEmployee_code());
		searchMap.put("Sdepartment_code", loginvo.getDepartment_code());
		
		searchMap.put("resigner", request.getParameter("resigner"));
		searchMap.put("date", request.getParameter("date"));
		System.out.println("###########"+request.getParameter("day"));
		searchMap.put("day", request.getParameter("day"));
		searchMap.put("department", request.getParameter("department"));
		searchMap.put("site", request.getParameter("site"));
		searchMap.put("yearsOption", request.getParameter("yearsOption"));
				

		List<HM_P0039VO> data = hM_P0039Service.searchList(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	
}
