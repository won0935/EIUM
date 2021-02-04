package com.myspring.eium.hm.hm_p0035.controller;

import java.util.ArrayList;
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

import com.myspring.eium.hm.hm_p0035.service.HM_P0035ServiceImpl;
import com.myspring.eium.hm.hm_p0035.vo.HM_P0035VO;
import com.myspring.eium.login.vo.LoginVO;



@Controller
public class HM_P0035ControllerImpl implements HM_P0035Controller{
	private static final Logger logger = LoggerFactory.getLogger(HM_P0035ControllerImpl.class);
	
	@Autowired
	HM_P0035ServiceImpl HM_P0035Service;
	@Autowired
	HM_P0035VO HM_P0035VO;
	
	@Override
	@RequestMapping(value = "/hm/p0035/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0035/p0035");
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0035/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
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
		
		int n =  (Integer) accessMap.get("M019");
		System.out.println(accessRange.get(n));
		System.out.println("사원코드"+loginvo.getEmployee_code());
		System.out.println("부서코드"+loginvo.getDepartment_code());
		
		searchMap.put("access_range", accessRange.get(n));
		searchMap.put("Semployee_code",loginvo.getEmployee_code());
		searchMap.put("Sdepartment_code", loginvo.getDepartment_code());
		searchMap.put("SiteList", request.getParameter("SiteList"));
		searchMap.put("DeptList", request.getParameter("DeptList"));
		searchMap.put("searchDate1", request.getParameter("searchDate1"));
		searchMap.put("searchDate2", request.getParameter("searchDate2"));
		searchMap.put("resigner", request.getParameter("resigner"));
		
		List<HM_P0035VO> data = HM_P0035Service.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}

	@Override
	@RequestMapping(value = "hm/p0035/SiteList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchSiteList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		// �˻����Ǽ���
		searchMap.put("p_id", request.getParameter("p_id"));
		
		//������ ��ȸ
		List<HM_P0035VO> data = HM_P0035Service.searchSiteList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "hm/p0035/DeptList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchDeptList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		// �˻����Ǽ���
		searchMap.put("SiteList", request.getParameter("SiteList"));
		
		//������ ��ȸ
		List<HM_P0035VO> data = HM_P0035Service.searchDeptList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	
}
