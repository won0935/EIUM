package com.myspring.eium.sm.sm_p0001.controller;

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

import com.myspring.eium.login.vo.LoginVO;
import com.myspring.eium.sm.sm_p0001.service.SM_P0001Service;
import com.myspring.eium.sm.sm_p0001.vo.SM_P0001VO;

@Controller
public class SM_P0001ControllerImpl implements SM_P0001Controller {
	private static final Logger logger = LoggerFactory.getLogger(SM_P0001ControllerImpl.class);
	
	@Autowired
	SM_P0001Service sM_P0001Service;
	
	@Autowired
	SM_P0001VO sM_P0001VO;
	
	@Override
	@RequestMapping(value = "/sm/p0001/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("sm/sm_p0001/p0001_home");
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/sm/p0001/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		//데이터 조회
		List<SM_P0001VO> data = sM_P0001Service.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	
	@Override
	@RequestMapping(value = "/sm/p0001/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // 저장할Data
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 처리결과
		
		HttpSession session = request.getSession(); 
		LoginVO loginvo = new LoginVO();
		loginvo = (LoginVO)session.getAttribute("login"); 
		String user= (loginvo.getEmployee_id());
		System.out.println("####################"+loginvo.getEmployee_id());
		  
		// 저장 Data 추출하기
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			sM_P0001Service.saveData(dataMap,user);	
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

	@Override
	@RequestMapping(value = "/sm/p0001/findAddress.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findAddress(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("sm/sm_p0001/p0001_home_p01");
		return mav;

	}

	
}
