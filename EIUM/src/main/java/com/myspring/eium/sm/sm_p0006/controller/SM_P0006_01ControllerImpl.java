package com.myspring.eium.sm.sm_p0006.controller;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.eium.login.vo.LoginVO;
import com.myspring.eium.sm.sm_p0006.service.SM_P0006_01ServiceImpl;
import com.myspring.eium.sm.sm_p0006.vo.SM_P0006_01VO;



@Controller
public class SM_P0006_01ControllerImpl implements SM_P0006_01Controller{
	/*@RequestMapping(value = { "/member/loginForm.do", "/member/memberForm.do" }, method =  RequestMethod.GET)*/
	
	@Autowired
	SM_P0006_01ServiceImpl sM_P0006_01ServiceImpl;
	@Autowired
	SM_P0006_01VO sM_P0006_01VO;
	
/*	@RequestMapping(value = "/sm/p0006_01.do", method =  RequestMethod.GET)
	public ModelAndView form5(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}*/
	
	@Override
	@RequestMapping(value = "/sm/p0006_01/search.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		// �˻����Ǽ���
		searchMap.put("x", request.getParameter("x"));
		//������ ��ȸ
		List<SM_P0006_01VO> data = sM_P0006_01ServiceImpl.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/sm/p0006_01/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // ������ Data
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ó�����
		
		HttpSession session = request.getSession(); LoginVO loginvo = new LoginVO();
		loginvo = (LoginVO)session.getAttribute("login"); 
		String user= (loginvo.getEmployee_id());
		
	    String x = request.getParameter("x");
	    
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			System.out.println(name);
			String[] values = request.getParameterValues(name);
			System.out.println(name);
			dataMap.put(name, values);
		}
		
		
		for(String key : dataMap.keySet()){
            String[] value = dataMap.get(key);
        }

		Map<String, String> result = new HashMap<String, String>();
		/*try {
			p0006_01ServiceImpl.saveData(dataMap, x);	
			result.put("Code","0");
			result.put("Message","����Ǿ����ϴ�");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","���忡 �����Ͽ����ϴ�");
			e.printStackTrace();
		}*/
		sM_P0006_01ServiceImpl.saveData(dataMap, x, user);	
		resultMap.put("Result", result);         
        return resultMap;
	}
	
	
/*	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/",1), viewName.length());
		}
		return viewName;
	} */

}
