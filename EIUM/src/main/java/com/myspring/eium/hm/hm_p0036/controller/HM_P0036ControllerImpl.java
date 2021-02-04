package com.myspring.eium.hm.hm_p0036.controller;

import java.util.ArrayList;
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

import com.myspring.eium.hm.hm_p0036.service.HM_P0036Service;
import com.myspring.eium.hm.hm_p0036.vo.HM_P0036VO;
import com.myspring.eium.login.vo.LoginVO;




@Controller
public class HM_P0036ControllerImpl  implements HM_P0036Controller{

	@Autowired
	HM_P0036Service hM_P0036Service;
	
	@Autowired
	HM_P0036VO hM_P0036VO;
	
	@Override
	@RequestMapping(value = "hm/p0036/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView tabInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0036/p0036_tab");
	
		return mav;
	}
	@Override
	@RequestMapping(value = "hm/p0036/searchInit1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView tabInit2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0036/p0036_tab1");
	
		return mav;
	}
	@Override
	@RequestMapping(value = "hm/p0036/searchInit2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView tabInit3(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0036/p0036_tab2");
	
		return mav;
	}
	@Override
	@RequestMapping(value = "hm/p0036/searchInit3.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView tabInit4(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0036/p0036_tab3");
	
		return mav;
	}
	
	@Override
	@RequestMapping(value = "hm/p0036/job_class_p01.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView job_class_p01(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0036/p0036_job_class_p01");
	
		return mav;
	}
	
	@Override
	@RequestMapping(value = "hm/p0036/position_p02.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView position_p02(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0036/p0036_position_p02");
	
		return mav;
	}
	
	@Override
	@RequestMapping(value = "hm/p0036/duty_p03.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView duty_p03(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0036/p0036_duty_p03");
	
		return mav;
	}
	@Override
	@RequestMapping(value = "hm/p0036/job_dis_p04.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView job_dis_p04(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0036/p0036_job_dis_p04");
	
		return mav;
	}
	@Override
	@RequestMapping(value = "hm/p0036/work_type_p05.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView work_type_p05(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0036/p0036_work_type_p05");
	
		return mav;
	}
	@Override
	@RequestMapping(value = "hm/p0036/pay_type_p06.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView pay_type_p06(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0036/p0036_pay_type_p06");
	
		return mav;
	}

	
	@Override
	@RequestMapping(value = "/hm/p0036/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		HttpSession session = request.getSession(); 
		LoginVO loginvo = new LoginVO();
		loginvo = (LoginVO)session.getAttribute("login"); 
		
		Map<String, Object> accessMap = new HashMap<String, Object>();
		ArrayList<String> accessRange = new ArrayList<String>();		
		accessRange = (ArrayList<String>) session.getAttribute("access_range"); 
		accessMap = (Map<String, Object>) session.getAttribute("accessnum");	
		
		int n =  (Integer) accessMap.get("M018");
		System.out.println(accessRange.get(n));
		System.out.println("사원코드"+loginvo.getEmployee_code());
		System.out.println("부서코드"+loginvo.getDepartment_code());
		
		searchMap.put("access_range", accessRange.get(n));
		searchMap.put("Semployee_code",loginvo.getEmployee_code());
		searchMap.put("Sdepartment_code", loginvo.getDepartment_code());		
		searchMap.put("date", request.getParameter("date"));
		searchMap.put("date2", request.getParameter("date2"));
		searchMap.put("site", request.getParameter("site"));
		searchMap.put("department", request.getParameter("department"));
		searchMap.put("job_class", request.getParameter("job_class"));
		searchMap.put("position", request.getParameter("position"));
		searchMap.put("duty", request.getParameter("duty"));
		searchMap.put("job_dis", request.getParameter("job_dis"));
		searchMap.put("work_type", request.getParameter("work_type"));
		searchMap.put("pay_type", request.getParameter("pay_type"));
		searchMap.put("resigner", request.getParameter("resigner"));


		

		List<HM_P0036VO> data = hM_P0036Service.searchList(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	@Override
	@RequestMapping(value = "/hm/p0036/searchList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		searchMap.put("date", request.getParameter("date"));
		searchMap.put("date2", request.getParameter("date2"));
		searchMap.put("site", request.getParameter("site"));
		searchMap.put("department", request.getParameter("department"));
		searchMap.put("job_class", request.getParameter("job_class"));
		searchMap.put("position", request.getParameter("position"));
		searchMap.put("duty", request.getParameter("duty"));
		searchMap.put("job_dis", request.getParameter("job_dis"));
		searchMap.put("work_type", request.getParameter("work_type"));
		searchMap.put("pay_type", request.getParameter("pay_type"));
		searchMap.put("resigner", request.getParameter("resigner"));
	

		

		List<HM_P0036VO> data = hM_P0036Service.searchList2(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	@Override
	@RequestMapping(value = "/hm/p0036/searchList3.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList3(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		searchMap.put("date", request.getParameter("date"));
		searchMap.put("date2", request.getParameter("date2"));
		searchMap.put("site", request.getParameter("site"));
		searchMap.put("department", request.getParameter("department"));
		searchMap.put("job_class", request.getParameter("job_class"));
		searchMap.put("position", request.getParameter("position"));
		searchMap.put("duty", request.getParameter("duty"));
		searchMap.put("job_dis", request.getParameter("job_dis"));
		searchMap.put("work_type", request.getParameter("work_type"));
		searchMap.put("pay_type", request.getParameter("pay_type"));
		searchMap.put("resigner", request.getParameter("resigner"));
	

		

		List<HM_P0036VO> data = hM_P0036Service.searchList3(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	@Override
	@RequestMapping(value = "/hm/p0036/searchList_p01.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_p01(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
	

		List<HM_P0036VO> data = hM_P0036Service.searchList_p01(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}

	@Override
	@RequestMapping(value = "/hm/p0036/searchList_p02.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_p02(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
	

		List<HM_P0036VO> data = hM_P0036Service.searchList_p02(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}

	
	@Override
	@RequestMapping(value = "/hm/p0036/searchList_p03.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_p03(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
	

		List<HM_P0036VO> data = hM_P0036Service.searchList_p03(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	@Override
	@RequestMapping(value = "/hm/p0036/searchList_p04.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_p04(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
	

		List<HM_P0036VO> data = hM_P0036Service.searchList_p04(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	@Override
	@RequestMapping(value = "/hm/p0036/searchList_p05.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_p05(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
	

		List<HM_P0036VO> data = hM_P0036Service.searchList_p05(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	@Override
	@RequestMapping(value = "/hm/p0036/searchList_p06.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_p06(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
	

		List<HM_P0036VO> data = hM_P0036Service.searchList_p06(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}

	

}
