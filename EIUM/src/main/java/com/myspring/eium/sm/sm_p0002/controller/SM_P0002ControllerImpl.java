package com.myspring.eium.sm.sm_p0002.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.eium.sm.sm_p0002.service.SM_P0002Service;
import com.myspring.eium.sm.sm_p0002.vo.SM_P0002VO;




@Controller
public class SM_P0002ControllerImpl implements SM_P0002Controller {
	private static final Logger logger = LoggerFactory.getLogger(SM_P0002ControllerImpl.class);
	@Autowired
	SM_P0002Service sM_P0002Service;
	
	@Override
	@RequestMapping(value = "/sm/p0002/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("sm/sm_p0002/p0002_home");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/sm/p0002/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
				
		searchMap.put("param", request.getParameter("param"));
		
		List<SM_P0002VO> data = sM_P0002Service.searchList(searchMap);

        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
        return resultMap;
	}
	

	@Override
	@RequestMapping(value = "/sm/p0002/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		
	
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			sM_P0002Service.saveData(dataMap);	
			result.put("Code","0");
			result.put("Message","���옣�꽦怨�");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","���옣�떎�뙣");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result);         
        return resultMap;
	}

	
	@Override
	@RequestMapping(value = "/sm/p0002/findAddress.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findAddress(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/sm/sm_p0002/p0002_home_p01");
		return mav;

	}
	@Override
	@RequestMapping(value = "/sm/p0002/findPopup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findPopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/sm/sm_p0002/p0002_home_p02");
		return mav;
	}
	@Override
	@RequestMapping(value = "/sm/p0002/searchList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		List<SM_P0002VO> data = sM_P0002Service.searchList2(searchMap);

        resultMap.put("Data", data);
        return resultMap;
	}
}
