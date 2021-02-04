package com.myspring.eium.hm.hm_p0001.controller;

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

import com.myspring.eium.hm.hm_p0001.service.HM_P0001Service;
import com.myspring.eium.hm.hm_p0001.vo.HM_P0001VO;
import com.myspring.eium.hm.hm_p0001.vo.HM_P0001_01VO;
import com.myspring.eium.login.vo.LoginVO;

@Controller
public class HM_P0001ControllerImpl implements HM_P0001Controller {
	private static final Logger logger = LoggerFactory.getLogger(HM_P0001ControllerImpl.class);

	@Autowired
	HM_P0001Service p0001Service;

	@Override
	@RequestMapping(value = "/hm/p0001/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0001/p0001_home");

		return mav;
	}

	@Override
	@RequestMapping(value = "/hm/p0001/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<HM_P0001VO> data = p0001Service.searchList(searchMap);

		resultMap.put("Data", data);
		System.out.println("HM-P0001ControllerImpl-1-resultMap::::" + resultMap);
		return resultMap;
	}

	@Override
	@RequestMapping(value = "/hm/p0001/searchList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String> searchMap = new HashMap<String, String>();
		Map<String, Object> resultMap = new HashMap<String, Object>();

		searchMap.put("P_POSITION_CODE", request.getParameter("position_CODE"));
		searchMap.put("P_START_DATE", request.getParameter("start_DATE"));
		List<HM_P0001VO> data = p0001Service.searchList2(searchMap);
		resultMap.put("Data", data);
		System.out.println("HM-P0001ControllerImpl-2-resultMap::::" + resultMap);
		return resultMap;
	}

	@Override
	@RequestMapping(value = "/hm/p0001/searchList3.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList3(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String> searchMap = new HashMap<String, String>();
		Map<String, Object> resultMap = new HashMap<String, Object>();

		searchMap.put("PP_POSITION_CODE", request.getParameter("position_CODE2"));
		searchMap.put("P_PAY_GRADE_CODE", request.getParameter("pay_GRADE_CODE"));
		List<HM_P0001VO> data = p0001Service.searchList3(searchMap);
		resultMap.put("Data", data);
		System.out.println("HM-P0001ControllerImpl-3-resultMap::::" + resultMap);
		return resultMap;
	}

	@Override
	@RequestMapping(value = "/hm/p0001/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>();
		Map<String, Object> resultMap = new HashMap<String, Object>();

		HttpSession session = request.getSession(); 
		LoginVO loginvo = new LoginVO();
		loginvo = (LoginVO)session.getAttribute("login"); 
		String user= (loginvo.getEmployee_id());
		System.out.println("####################"+loginvo.getEmployee_id());
		
		String p_position_CODE = request.getParameter("p_position_CODE");
		System.out.println("p_position_CODE : " + p_position_CODE);
		String PP_START_DATE = request.getParameter("PP_START_DATE");
		System.out.println("PP_START_DATE : " + PP_START_DATE);
		
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}

		Map<String, String> result = new HashMap<String, String>();

		try {
			p0001Service.saveData(dataMap, p_position_CODE, PP_START_DATE, user);
			result.put("Code", "0");
			result.put("Message", "저장성공");
		} catch (Exception e) {
			result.put("Code", "-1");
			result.put("Message", "저장실패");
			e.printStackTrace();
		}

		resultMap.put("Result", result);
		return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0001/SALARY_saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map SALARY_saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SAVADATA-------");
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>();
		Map<String, Object> resultMap = new HashMap<String, Object>();

		HttpSession session = request.getSession(); 
		LoginVO loginvo = new LoginVO();
		loginvo = (LoginVO)session.getAttribute("login"); 
		String user= (loginvo.getEmployee_id());
		System.out.println("####################"+loginvo.getEmployee_id());
		
		String p_position_CODE = request.getParameter("p_position_CODE");
		System.out.println("p_position_CODE : " + p_position_CODE);
		String PP_START_DATE = request.getParameter("PP_START_DATE");
		System.out.println("PP_START_DATE : " + PP_START_DATE);
		
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}

		Map<String, String> result = new HashMap<String, String>();

		try {
			p0001Service.SALARY_saveData(dataMap, p_position_CODE, PP_START_DATE, user);
			result.put("Code", "0");
			result.put("Message", "저장성공");
		} catch (Exception e) {
			result.put("Code", "-1");
			result.put("Message", "저장실패");
			e.printStackTrace();
		}

		resultMap.put("Result", result);
		return resultMap;
	}

	@Override
	@RequestMapping(value = "/hm/p0001/DATE_deleteData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map DATE_deleteData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>();
		Map<String, Object> resultMap = new HashMap<String, Object>();

		HttpSession session = request.getSession(); 
		LoginVO loginvo = new LoginVO();
		loginvo = (LoginVO)session.getAttribute("login"); 
		String user= (loginvo.getEmployee_id());
		System.out.println("####################"+loginvo.getEmployee_id());
		
		String p_position_CODE = request.getParameter("p_position_CODE");
		System.out.println("p_position_CODE : " + p_position_CODE);
		String PP_START_DATE = request.getParameter("PP_START_DATE");
		System.out.println("PP_START_DATE : " + PP_START_DATE);
		
		
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}

		Map<String, String> result = new HashMap<String, String>();

		try {
			p0001Service.DATE_deleteData(dataMap, p_position_CODE, PP_START_DATE, user);
			result.put("Code", "0");
			result.put("Message", "저장성공");
		} catch (Exception e) {
			result.put("Code", "-1");
			result.put("Message", "저장실패");
			e.printStackTrace();
		}

		resultMap.put("Result", result);
		return resultMap;
	}

}
