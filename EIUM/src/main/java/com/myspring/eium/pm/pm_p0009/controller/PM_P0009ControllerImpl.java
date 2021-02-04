package com.myspring.eium.pm.pm_p0009.controller;


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

import com.myspring.eium.pm.pm_p0009.dao.PM_P0009DAO;
import com.myspring.eium.pm.pm_p0009.service.PM_P0009Service;
import com.myspring.eium.pm.pm_p0009.vo.PM_P0009VO;


@Controller
public class PM_P0009ControllerImpl implements PM_P0009Controller {
	private static final Logger logger = LoggerFactory.getLogger(PM_P0009ControllerImpl.class);

	@Autowired
	PM_P0009Service p0009Service;
	@Autowired
	PM_P0009DAO p0009dao;

	
	
	@Override
	@RequestMapping(value = "/pm/p0009/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("pm/pm_p0009/p0009_home");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/pm/p0009/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
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
		List<PM_P0009VO> data = p0009Service.searchList(searchMap);
        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
    	
        return resultMap;
	}
		
	

}
