package com.myspring.eium.hm.hm_p0007.controller;



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

import com.myspring.eium.hm.hm_p0007.service.HM_P0007_10Service;
import com.myspring.eium.hm.hm_p0007.vo.HM_P0007_10VO;
import com.myspring.eium.login.vo.LoginVO;




@Controller
public class HM_P0007_10ControllerImpl implements HM_P0007_10Controller {
	private static final Logger logger = LoggerFactory.getLogger(HM_P0007_10ControllerImpl.class);
	@Autowired
	HM_P0007_10Service hM_P0007_10Service;
	
	
	@Override
	@RequestMapping(value = "/hm/p0007/searchEmployee_language.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchLanguage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		searchMap.put("x", request.getParameter("x"));
		
		
		List<HM_P0007_10VO> data = hM_P0007_10Service.searchList(searchMap);

        resultMap.put("Data", data);
        for(int i=0; i<data.size(); i++) {
        data.get(i);
        }
    	System.out.println("resultMap::::"+resultMap);
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0007/saveEmployee_language.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>();  // 저장할 Data
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 처리결과
	
		  HttpSession session = request.getSession(); LoginVO loginvo = new LoginVO();
		  loginvo = (LoginVO)session.getAttribute("login"); 
		  String user= (loginvo.getEmployee_name());
	

		
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
			hM_P0007_10Service.saveData(dataMap, user);	
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
