package com.myspring.eium.sm.sm_p0003.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.eium.login.vo.LoginVO;
import com.myspring.eium.sm.sm_p0003.service.SM_P0003Service;
import com.myspring.eium.sm.sm_p0003.vo.SM_P0003VO;








@Controller
public class SM_P0003ControllerImpl implements SM_P0003Controller{
	private static final Logger logger = LoggerFactory.getLogger(SM_P0003ControllerImpl.class);
	
	@Autowired
	private SM_P0003Service sM_P0003Service;
	
	@Autowired
	SM_P0003VO sM_P0003VO;
	
	
	@Override
	@RequestMapping(value = "sm/p0003/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("/sm/sm_p0003/p0003_search");
	
		return mav;
	} 
	

	@Override
	@RequestMapping(value = "sm/p0003/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
	
		searchMap.put("SiteList", request.getParameter("SiteList"));
	
		List<SM_P0003VO> data = sM_P0003Service.searchList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	


	@Override
	@RequestMapping(value = "sm/p0003/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // ������Daa
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ó�����
		
		
		  HttpSession session = request.getSession(); LoginVO loginvo = new LoginVO();
		  loginvo = (LoginVO)session.getAttribute("login"); 
		  String user= (loginvo.getEmployee_id());
		  System.out.println("####################"+loginvo.getEmployee_id());
		 

		// ���� Data �����ϱ�
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			sM_P0003Service.saveData(dataMap,user);	
			result.put("Code","0");
			result.put("Message","저장성공");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","저장실패");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result); 
		
        return result;
	}
	
	
	
	

	
	
	
	@Override
	@RequestMapping(value = "sm/p0003/registSector_p01.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView popup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("sm/sm_p0003/p0003_registSector_p01");

		return mav;
	} 


	@Override
	@RequestMapping(value = "sm/p0003/searchpopup.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchpopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		// �˻����Ǽ���
		searchMap.put("p_id", request.getParameter("p_id"));
		
		//������ ��ȸ
		List<SM_P0003VO> data = sM_P0003Service.searchpopup(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	

	
	
	@Override
	@RequestMapping(value = "sm/p0003/saveDatapopup.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveDataPopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // ������Daa
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ó�����
		
		
		  HttpSession session = request.getSession(); LoginVO
		  loginvo = new LoginVO();
		  loginvo = (LoginVO)session.getAttribute("login"); 
		  String user= (loginvo.getEmployee_id());
		  System.out.println("####################"+loginvo.getEmployee_id());
		 
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			sM_P0003Service.saveDatapopup(dataMap,user);	
			result.put("Code","0");
			result.put("Message","저장성공");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","저장실패");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result); 
		
        return result;
	}
	
	@Override
	@RequestMapping(value = "sm/p0003/SiteList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchSiteList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		// �˻����Ǽ���
		searchMap.put("p_id", request.getParameter("p_id"));
		
		//������ ��ȸ
		List<SM_P0003VO> data = sM_P0003Service.searchSiteList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "sm/p0003/sectorSearch_Init.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sectorSerch_init(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("/sm/sm_p0003/p0003_sectorSearch_p01");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "sm/p0003/sectorSearch_p01.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map sectorSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		

		searchMap.put("p_id", request.getParameter("p_id"));
		

		List<SM_P0003VO> data = sM_P0003Service.searchpopup(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	@Override
	@RequestMapping(value = "sm/p0003/siteSearch_Init.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView siteSerch_init(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("/sm/sm_p0003/p0003_siteSearch_p01");
	
		return mav;
	} 

	@Override
	@RequestMapping(value = "sm/p0003/siteSearch_p01.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map siteSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		// �˻����Ǽ���
		searchMap.put("p_id", request.getParameter("p_id"));
		
		//������ ��ȸ
		List<SM_P0003VO> data = sM_P0003Service.searchSiteList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "sm/p0003/siteSearchInit_p01.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView siteSearchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("sm/sm_p0003/p0003_siteSearch_p01");
		return mav;
	} 

	
	

}
