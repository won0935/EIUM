package com.myspring.eium.hm.hm_p0007.controller;



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

import com.myspring.eium.hm.hm_p0007.dao.HM_P0007DAO;
import com.myspring.eium.hm.hm_p0007.service.HM_P0007Service;
import com.myspring.eium.hm.hm_p0007.vo.HM_P0007VO;
import com.myspring.eium.login.vo.LoginVO;




@Controller
public class HM_P0007ControllerImpl implements HM_P0007Controller {
	private static final Logger logger = LoggerFactory.getLogger(HM_P0007ControllerImpl.class);
	@Autowired
	HM_P0007Service hM_P0007Service;
	HM_P0007DAO p0007dao;

	
	@Override
	@RequestMapping(value = "/hm/p0007/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0007/p0007");
	
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0007/language_Popup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView language_Popup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0007/p0007_languageList");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0007/license_Popup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView license_Popup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0007/p0007_licenseList");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0007/assessment_Popup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView assessment_Popup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0007/p0007_assessmentList");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0007/rnp_Popup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView rnp_Popup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0007/p0007_rnpList");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0007/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
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

		int n =  (Integer) accessMap.get("M011");
		System.out.println(accessRange.get(n));
		System.out.println("사원코드"+loginvo.getEmployee_code());
		System.out.println("부서코드"+loginvo.getDepartment_code());

		searchMap.put("access_range", accessRange.get(n));
		searchMap.put("Semployee_code",loginvo.getEmployee_code());
		searchMap.put("Sdepartment_code", loginvo.getDepartment_code());
		
		
		List<HM_P0007VO> data = hM_P0007Service.searchList(searchMap);

        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0007/license_List.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map license_List(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		
		
		List<HM_P0007VO> data = hM_P0007Service.licenseList(searchMap);

        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0007/assessment_List.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map assessment_List(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		
		
		List<HM_P0007VO> data = hM_P0007Service.assessmentList(searchMap);

        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0007/rnp_List.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map rnp_List(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		
		
		List<HM_P0007VO> data = hM_P0007Service.rnpList(searchMap);

        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0007/language_List.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map language_List(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		
		
		List<HM_P0007VO> data = hM_P0007Service.languageList(searchMap);

        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
        return resultMap;
	}
	
	
	
	

	@Override
	@RequestMapping(value = "/hm/p0007/saveHr_info.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		
		HttpSession session = request.getSession(); LoginVO loginvo = new LoginVO();
		loginvo = (LoginVO)session.getAttribute("login"); 
		String user= (loginvo.getEmployee_name());
		 String x =request.getParameter("x");

		  
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 
		searchMap.put("tempStr", request.getParameter("tempStr"));
	
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			hM_P0007Service.saveData(dataMap, user, x);	
			result.put("Code","0");
			result.put("Message","저장성공");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","저장실패");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result);         
        return resultMap;
	}
	
	
	
	
	
	
	


	
}
