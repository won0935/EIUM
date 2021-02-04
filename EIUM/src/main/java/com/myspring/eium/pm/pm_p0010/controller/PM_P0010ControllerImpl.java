package com.myspring.eium.pm.pm_p0010.controller;


import java.util.Enumeration;
import java.util.HashMap;

import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import com.myspring.eium.pm.pm_p0010.dao.PM_P0010DAO;
import com.myspring.eium.pm.pm_p0010.service.PM_P0010Service;
import com.myspring.eium.pm.pm_p0010.vo.PM_P0010VO;



@Controller
public class PM_P0010ControllerImpl implements PM_P0010Controller {
	private static final Logger logger = LoggerFactory.getLogger(PM_P0010ControllerImpl.class);

	@Autowired
	PM_P0010Service p0010Service;
	@Autowired
	PM_P0010DAO p0010dao;
	
	@Override
	@RequestMapping(value = "/pm/p0010/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("pm/pm_p0010/p0010_home");
	
		return mav;
	} 

		
	@Override
	@RequestMapping(value = "/pm/p0010/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			System.out.println(name+";:::::"+values[0]);
			searchMap.put(name, values[0]);
		}
		List<PM_P0010VO> data = p0010Service.searchList(searchMap);
        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
    	
        return resultMap;
	}
	@Override
	@RequestMapping(value = "/pm/p0010/searchList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			System.out.println(name+";:::::"+values[0]);
			searchMap.put(name, values[0]);
		}
		List<PM_P0010VO> data = p0010Service.searchList2(searchMap);
		resultMap.put("Data", data);
		System.out.println("resultMap::::"+resultMap);
		
		return resultMap;
	}
	@Override
	@RequestMapping(value = "/pm/p0010/searchList3.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList3(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			System.out.println(name+";:::::"+values[0]);
			searchMap.put(name, values[0]);
		}
		List<PM_P0010VO> data = p0010Service.searchList3(searchMap);
		resultMap.put("Data", data);
		System.out.println("resultMap::::"+resultMap);
		
		return resultMap;
	}

}
