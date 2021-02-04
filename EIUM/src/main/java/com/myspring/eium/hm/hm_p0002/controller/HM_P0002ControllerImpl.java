package com.myspring.eium.hm.hm_p0002.controller;

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

import com.myspring.eium.hm.hm_p0002.service.HM_P0002Service;
import com.myspring.eium.hm.hm_p0002.vo.HM_P0002VO;
import com.myspring.eium.login.vo.LoginVO;





@Controller
public class HM_P0002ControllerImpl implements HM_P0002Controller{
	private static final Logger logger = LoggerFactory.getLogger(HM_P0002ControllerImpl.class);
	String x = null;
	@Autowired
	private HM_P0002Service hM_P0002Service;
	
	
	@Autowired
	HM_P0002VO hM_P0002VO;

	
	@Override
	@RequestMapping(value = "/hm/p0002/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0002/p0002");
		
		
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0002/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
					//testetstettt
		searchMap.put("date", request.getParameter("monthpicker"));
		System.out.println(request.getParameter("monthpicker"));

		
		List<HM_P0002VO> data = hM_P0002Service.searchList(searchMap);

        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0002/searchSelect.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchSelect(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
					//testetstettt
		searchMap.put("x", request.getParameter("x"));	
		x=request.getParameter("x");	

		List<HM_P0002VO> data = hM_P0002Service.searchSelect(searchMap);

        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
        return resultMap;
	}
	
	
	@Override
	@RequestMapping(value = "/hm/p0002/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		
		HttpSession session = request.getSession(); 
		LoginVO loginvo = new LoginVO();
		loginvo = (LoginVO)session.getAttribute("login"); 
		String user= (loginvo.getEmployee_name());
	
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			System.out.println(name);
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			hM_P0002Service.saveData(dataMap, user);	
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
	
	@Override
	@RequestMapping(value = "/hm/p0002/saveSelect.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveSelect(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap2 = new HashMap<String, String[]>(); 
		Map<String, Object> resultMap2 = new HashMap<String, Object>(); 

		HttpSession session = request.getSession(); 
		LoginVO loginvo = new LoginVO();
		loginvo = (LoginVO)session.getAttribute("login"); 
		String user= (loginvo.getEmployee_name());
		
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			System.out.println(name);
			String[] values = request.getParameterValues(name);
			dataMap2.put(name, values);
		}
		
		Map<String, String> result2 = new HashMap<String, String>();
		try {
			hM_P0002Service.saveSelect(dataMap2, user, x);	
			result2.put("Code","0");
			result2.put("Message","저장성공");
		}catch(Exception e) {
			result2.put("Code","-1");
			result2.put("Message","저장실패");
			e.printStackTrace();
		}
		
		resultMap2.put("Result", result2);         
        return resultMap2;
	}
	
	
	@Override
	@RequestMapping(value = "hm/p0002/site_Search.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView siteSerch_init(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("/hm/hm_p0002/p0002_SiteSearch");
	
		return mav;
	} 

	
	@Override
	@RequestMapping(value = "hm/p0002/site_Search1.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map siteSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		

		List<HM_P0002VO> data = hM_P0002Service.searchSiteList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "hm/p0002/jobclass_Search.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView jobclassSerch_init(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("/hm/hm_p0002/p0002_JobClassSearch");
	
		return mav;
	} 

	
	@Override
	@RequestMapping(value = "hm/p0002/jobclass_Search1.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map jobclassSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		List<HM_P0002VO> data = hM_P0002Service.searchJobclassList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	

	
	
	

	
	

}
