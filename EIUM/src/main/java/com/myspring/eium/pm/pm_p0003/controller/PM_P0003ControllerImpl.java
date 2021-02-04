package com.myspring.eium.pm.pm_p0003.controller;


import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.ParseConversionEvent;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.eium.login.vo.LoginVO;
import com.myspring.eium.pm.pm_p0003.service.PM_P0003Service;
import com.myspring.eium.pm.pm_p0003.vo.PM_P0003VO;




@Controller
public class PM_P0003ControllerImpl implements PM_P0003Controller {
	private static final Logger logger = LoggerFactory.getLogger(PM_P0003ControllerImpl.class);
	String x=null;
	String y=null;
	Map<String, Object> dateMap = new HashMap<String, Object>();
	@Autowired
	PM_P0003Service p0003Service;
	
	@Override
	@RequestMapping(value = "/pm/p0003/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("pm/pm_p0003/p0003");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/pm/p0003/paygrade_Search.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView paygrade_Search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ModelAndView mav = new ModelAndView("pm/pm_p0003/p0003_paygradeSearch");
	
		return mav;
	} 
	
	
	
	@Override
	@RequestMapping(value = "/pm/p0003/searchPaymentdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView paymentdateSerch_init(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		dateMap.put("date", request.getParameter("monthpicker"));
		System.out.println(request.getParameter("monthpicker"));
		
		ModelAndView mav = new ModelAndView("pm/pm_p0003/p0003_Payment_date");
		
		mav.addObject("monthpicker",request.getParameter("monthpicker"));
	
		return mav;
	} 
	
	
	@Override
	@RequestMapping(value = "/pm/p0003/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
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
		
		int n =  (Integer) accessMap.get("M024");
		System.out.println(accessRange.get(n));
		System.out.println("사원코드"+loginvo.getEmployee_code());
		System.out.println("부서코드"+loginvo.getDepartment_code());
		
		searchMap.put("access_range", accessRange.get(n));
		searchMap.put("Semployee_code",loginvo.getEmployee_code());
		searchMap.put("Sdepartment_code", loginvo.getDepartment_code());
		
		
				

		searchMap.put("Ppayment_code", request.getParameter("Ppayment_code"));
		searchMap.put("searchSite", request.getParameter("searchSite"));
		searchMap.put("searchTYPE", request.getParameter("searchTYPE"));
		searchMap.put("searchDetail", request.getParameter("searchDetail"));


		System.out.println("Ppayment_code:"+request.getParameter("Ppayment_code"));
		System.out.println("searchSite:"+request.getParameter("searchSite"));
		System.out.println("searchTYPE:"+request.getParameter("searchTYPE"));
		System.out.println("searchDetail:"+request.getParameter("searchDetail"));

		
		List<PM_P0003VO> data = p0003Service.searchList(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}
	

	
	@Override
	@RequestMapping(value = "/pm/p0003/searchPaymentdateList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map payment_searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		searchMap= dateMap;
		List<PM_P0003VO> data = p0003Service.paydate_searchList(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/pm/p0003/paygrade_searchData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map paygrade_searchData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		searchMap.put("x", x);
		List<PM_P0003VO> data = p0003Service.paygrade_searchData(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}

	@Override
	@RequestMapping(value = "pm/p0003/TypeList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchTypeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // ???????
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ??????
		
		// ??????????
		searchMap.put("searchSite", request.getParameter("searchSite"));
		System.out.println(request.getParameter("searchSite"));
		//?????? ???
		List<PM_P0003VO> data = p0003Service.searchTypeList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	
	
	@Override
	@RequestMapping(value = "/pm/p0003/searchReceipt.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchReceipt(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		x =request.getParameter("x");
		y =request.getParameter("y");
		searchMap.put("x", request.getParameter("x"));
		System.out.println(x);
		searchMap.put("y", request.getParameter("y"));
		System.out.println(y);
		


		List<PM_P0003VO> data = p0003Service.searchReceipt(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}
	@Override
	@RequestMapping(value = "/pm/p0003/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		HttpSession session = request.getSession(); 
		LoginVO loginvo = new LoginVO();
		loginvo = (LoginVO)session.getAttribute("login"); 
		String user= (loginvo.getEmployee_name());
		System.out.println(user);
		System.out.println(x);
		System.out.println(y);

		
		
		// ���� Data �����ϱ�
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			System.out.println(name);
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			p0003Service.saveData(dataMap, user, x, y);	
			result.put("Code","0");
			result.put("Message","����Ǿ����ϴ�");
		}catch(Exception e) {                                                               
			result.put("Code","-1");
			result.put("Message","���忡 �����Ͽ����ϴ�");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result);         
        return resultMap;
	}


}