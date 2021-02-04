package com.myspring.eium.sm.sm_p0004.controller;

import java.util.Enumeration;
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

import com.myspring.eium.login.vo.LoginVO;
import com.myspring.eium.sm.sm_p0003.vo.SM_P0003VO;
import com.myspring.eium.sm.sm_p0004.service.SM_P0004ServiceImpl;
import com.myspring.eium.sm.sm_p0004.vo.SM_P0004VO;
//import com.myspring.pro27.login.vo.LoginVO;

@Controller
public class SM_P0004ControllerImpl implements SM_P0004Controller{
	/*@RequestMapping(value = { "/member/loginForm.do", "/member/memberForm.do" }, method =  RequestMethod.GET)*/
	@Autowired
	SM_P0004ServiceImpl p0004ServiceImpl;
	@Autowired
	SM_P0004VO p0004VO;
	
	@Override
	@RequestMapping(value = "sm/p0004/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView init(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("/sm/sm_p0004/p0004");
	
		return mav;
	}
	
	@Override
	@RequestMapping(value = "sm/p0004/company_Search.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView company_Search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("/sm/sm_p0004/p0004_companySearch");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/sm/p0004/search.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
/*		String i =loginVO.getEmployee_name();
		System.out.println(i);*/
		

		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		

	

				
		//데이터 조회
		List<SM_P0004VO> data = p0004ServiceImpl.searchList(searchMap);
		resultMap.put("Data", data);
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/sm/p0004/company_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map company_list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
/*		String i =loginVO.getEmployee_name();
		System.out.println(i);*/
		

		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		

	

				
		//데이터 조회
		List<SM_P0004VO> data = p0004ServiceImpl.companyList(searchMap);
		resultMap.put("Data", data);
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/sm/p0004/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>();  // 저장할 Data
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 처리결과
	
		  HttpSession session = request.getSession();
		  LoginVO loginvo = new LoginVO();
		  loginvo = (LoginVO)session.getAttribute("login"); 
		  String user = (loginvo.getEmployee_name());
	

		
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 
		searchMap.put("tempStr", request.getParameter("tempStr"));
		
		// 저장 Data 추출하기
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			p0004ServiceImpl.saveData(dataMap, user);	
			result.put("Code","0");
			result.put("Message","저장되었습니다");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","저장에 실패하였습니다");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result);         
        return resultMap;
	}
	
	
}
