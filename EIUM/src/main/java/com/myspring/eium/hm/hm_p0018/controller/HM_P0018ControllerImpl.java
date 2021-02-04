package com.myspring.eium.hm.hm_p0018.controller;

import java.io.IOException;
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

import com.myspring.eium.hm.hm_p0018.service.HM_P0018Service;
import com.myspring.eium.hm.hm_p0018.vo.HM_P0018VO;
import com.myspring.eium.login.vo.LoginVO;


@Controller
public class HM_P0018ControllerImpl implements HM_P0018Controller{
	private static final Logger logger = LoggerFactory.getLogger(HM_P0018ControllerImpl.class);
	
	@Autowired
	HM_P0018Service hM_P0018Service;
	
	@Autowired
	HM_P0018VO hM_P0018VO;

	
	@Override
	@RequestMapping(value = "hm/p0018/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView tabInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0018/p0018_tab");
		
		return mav;
	}
	@Override
	@RequestMapping(value = "hm/p0018/home2_p01.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView home2PopUPInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0018/p0018_home2_p01");
	
		return mav;
	}
	@Override
	@RequestMapping(value = "hm/p0018/home2_p02.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView home2PopUP2Init(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0018/p0018_home2_p02");
	
		return mav;
	}
	@Override
	@RequestMapping(value = "hm/p0018/searchInit2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView EduInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0018/p0018_home");
		
		return mav;
	} 
	@Override
	@RequestMapping(value = "hm/p0018/searchInit3.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView EdutargetInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0018/p0018_home2");
	
		return mav;
	} 
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	@RequestMapping(value = "/hm/p0018/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		searchMap.put("eduCode", request.getParameter("eduCode"));
		List<HM_P0018VO> data = hM_P0018Service.searchList(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0018/home2Search_p01.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map home2search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		searchMap.put("eduCode", request.getParameter("eduCode"));

		//데이터 조회
		List<HM_P0018VO> data = hM_P0018Service.searchList2(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	@Override
	@RequestMapping(value = "/hm/p0018/home2Search_p02.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map home2_p02Search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		searchMap.put("E_id", request.getParameter("E_id"));

		//데이터 조회
		List<HM_P0018VO> data = hM_P0018Service.employeeSearch(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
		
	@Override
	@RequestMapping(value = "/hm/p0018/emplyoeeListSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map emplyoeeListSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		searchMap.put("eduCode", request.getParameter("eduCode"));

		List<HM_P0018VO> data = hM_P0018Service.emplyoeeListSearch(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	
	
	@Override
	@RequestMapping(value = "/hm/p0018/autocomplete.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map autocomplete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		searchMap.put("eduCode", request.getParameter("eduCode"));
		List<HM_P0018VO> data = hM_P0018Service.autocomplete(searchMap);
	    resultMap.put("Data", data);
	    
	    
	    return resultMap;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	@RequestMapping(value = "hm/p0018/emplyoeeListsaveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map emplyoeeListsaveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		String param=request.getParameter("param");
		
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
			hM_P0018Service.emplyoeeListsaveData(dataMap,param,user);	
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
	
	@Override
	@RequestMapping(value = "hm/p0018/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
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
			hM_P0018Service.saveData(dataMap,user);	
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
