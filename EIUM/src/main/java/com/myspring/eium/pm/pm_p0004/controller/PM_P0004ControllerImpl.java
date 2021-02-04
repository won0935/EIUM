package com.myspring.eium.pm.pm_p0004.controller;


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
import com.myspring.eium.pm.pm_p0004.service.PM_P0004Service;
import com.myspring.eium.pm.pm_p0004.vo.PM_P0004VO;




@Controller
public class PM_P0004ControllerImpl implements PM_P0004Controller {
	private static final Logger logger = LoggerFactory.getLogger(PM_P0004ControllerImpl.class);
	String x=null;
	String y=null;
	Map<String, Object> dateMap = new HashMap<String, Object>();
	@Autowired
	PM_P0004Service p0004Service;
	
	@Override
	@RequestMapping(value = "/pm/p0004/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("pm/pm_p0004/p0004");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/pm/p0004/paygrade_Search.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView paygrade_Search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ModelAndView mav = new ModelAndView("pm/pm_p0004/p0004_paygradeSearch");
	
		return mav;
	} 
	
	
	
	@Override
	@RequestMapping(value = "/pm/p0004/searchPaymentdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView paymentdateSerch_init(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		dateMap.put("date", request.getParameter("monthpicker"));
		System.out.println("1");
		System.out.println(request.getParameter("monthpicker"));
		
		ModelAndView mav = new ModelAndView("pm/pm_p0004/p0004_Payment_date");
		
		mav.addObject("monthpicker",request.getParameter("monthpicker"));
	
		return mav;
	} 
	
	
	@Override
	@RequestMapping(value = "/pm/p0004/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		searchMap.put("Ppayment_code", request.getParameter("Ppayment_code"));
		searchMap.put("searchBank", request.getParameter("searchBank"));
		searchMap.put("searchSite", request.getParameter("searchSite"));
		searchMap.put("searchTYPE", request.getParameter("searchTYPE"));


		System.out.println(request.getParameter("Ppayment_code"));
		System.out.println(request.getParameter("searchBank"));
		System.out.println(request.getParameter("searchSite"));
		System.out.println(request.getParameter("searchTYPE"));


		List<PM_P0004VO> data = p0004Service.searchList(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}
	
	
	

	
	@Override
	@RequestMapping(value = "/pm/p0004/searchPaymentdateList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map payment_searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		searchMap= dateMap;
		List<PM_P0004VO> data = p0004Service.paydate_searchList(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/pm/p0004/paygrade_searchData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map paygrade_searchData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		searchMap.put("x", x);
		List<PM_P0004VO> data = p0004Service.paygrade_searchData(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "pm/p0004/TypeList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchTypeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // ???????
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ??????
		
		// ??????????
		searchMap.put("searchSite", request.getParameter("searchSite"));
		System.out.println(request.getParameter("searchSite"));
		//?????? ???
		List<PM_P0004VO> data = p0004Service.searchTypeList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "pm/p0004/BankList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map bankList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // ???????
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ??????
		

		List<PM_P0004VO> data = p0004Service.BankList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	
	
	@Override
	@RequestMapping(value = "/pm/p0004/searchReceipt.do", method = { RequestMethod.GET, RequestMethod.POST })
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

		List<PM_P0004VO> data = p0004Service.searchReceipt(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}
	@Override
	@RequestMapping(value = "/pm/p0004/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
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

		
		
		// 저장 Data 추출하기
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			System.out.println(name);
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			p0004Service.saveData(dataMap, user, x, y);	
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
