package com.myspring.eium.hm.hm_p0021.controller;

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

import com.myspring.eium.hm.hm_p0021.service.HM_P0021Service;
import com.myspring.eium.hm.hm_p0021.vo.HM_P0021VO;
import com.myspring.eium.login.vo.LoginVO;


@Controller
public class HM_P0021ControllerImpl implements HM_P0021Controller{
	private static final Logger logger = LoggerFactory.getLogger(HM_P0021ControllerImpl.class);

	@Autowired
	HM_P0021Service hM_P0021Service;
	
	@Autowired
	HM_P0021VO hM_P0021VO;
	
	@Override
	@RequestMapping(value = "hm/p0021/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView homeInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0021/p0021_home");
	
		return mav;
	}
	
	
	@Override
	@RequestMapping(value = "/hm/p0021/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		searchMap.put("eduCode", request.getParameter("eduCode"));
		System.out.println("컨트롤러######"+request.getParameter("eduCode"));
		List<HM_P0021VO> data = hM_P0021Service.searchList(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0021/eduScoreSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map eduScoreSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		
		int n =  (Integer) accessMap.get("M013");
		System.out.println(accessRange.get(n));
		System.out.println("사원코드"+loginvo.getEmployee_code());
		System.out.println("부서코드"+loginvo.getDepartment_code());
		
		searchMap.put("access_range", accessRange.get(n));
		searchMap.put("Semployee_code",loginvo.getEmployee_code());
		searchMap.put("Sdepartment_code", loginvo.getDepartment_code());
		
		searchMap.put("eduCode", request.getParameter("eduCode"));
		System.out.println("컨트롤러######"+request.getParameter("eduCode"));
		List<HM_P0021VO> data = hM_P0021Service.eduScoreSearch(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
        
	}
	
	
	
	
	@Override
	@RequestMapping(value = "hm/p0021/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		  HttpSession session = request.getSession(); LoginVO loginvo = new LoginVO();
		  loginvo = (LoginVO)session.getAttribute("login"); 
		  String user= (loginvo.getEmployee_id());
		  
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			hM_P0021Service.saveData(dataMap,user);	
			result.put("Code","0");
			result.put("Message","저장성공");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","저장실패");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result); 
		
        return result;
	}
	
	
	
}
