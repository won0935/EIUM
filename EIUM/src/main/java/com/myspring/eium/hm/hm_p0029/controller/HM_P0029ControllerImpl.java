package com.myspring.eium.hm.hm_p0029.controller;

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

import com.myspring.eium.hm.hm_p0029.dao.HM_P0029DAO;
import com.myspring.eium.hm.hm_p0029.service.HM_P0029Service;
import com.myspring.eium.hm.hm_p0029.vo.HM_P0029VO;
import com.myspring.eium.login.vo.LoginVO;

@Controller
public class HM_P0029ControllerImpl implements HM_P0029Controller {
	private static final Logger logger = LoggerFactory.getLogger(HM_P0029ControllerImpl.class);

	@Autowired
	HM_P0029Service p0029Service;
	@Autowired
	HM_P0029DAO p0029dao;

	// 탭
	@Override
	@RequestMapping(value = "/hm/p0029/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0029/p0029_tab");

		return mav;
	}

	// 교육 탭
	@Override
	@RequestMapping(value = "/hm/p0029/searchInit_TN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit_TN(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0029/p0029_TN");

		return mav;
	}

	// 출장 탭
	@Override
	@RequestMapping(value = "/hm/p0029/searchInit_BN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit_BN(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0029/p0029_BN");

		return mav;
	}

	// 자격/면허 탭
	@Override
	@RequestMapping(value = "/hm/p0029/searchInit_LI.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit_LI(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0029/p0029_LI");

		return mav;
	}

	// 어학시험 탭
	@Override
	@RequestMapping(value = "/hm/p0029/searchInit_LA.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit_LA(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0029/p0029_LA");

		return mav;
	}
	// 4가지 모델엔 뷰

	// 사업장 조회 모델엔뷰
	@Override
	@RequestMapping(value = "/hm/p0029/search_Site.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView search_Site(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0029/p0029_SearchSite");
		return mav;
	}

	// 사업장 팝업 리스트 조회
	@Override
	@RequestMapping(value = "/hm/p0029/searchList_site.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_site(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<HM_P0029VO> data = p0029Service.searchList_site(searchMap);

		resultMap.put("Data", data);
		return resultMap;
	}

	// 부서 팝업
	@Override
	@RequestMapping(value = "/hm/p0029/search_Dept.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView search_Dept(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0029/p0029_SearchDept");
		return mav;
	}

	// table로 팝업창 조회
	@Override
	@RequestMapping(value = "/hm/p0029/findPopup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findPopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/hm/hm_p0029/p0029_home_p02");
		mav.addObject("command", request.getParameter("command"));
		mav.addObject("index", request.getParameter("index"));
		return mav;
	}

	// 팝업 조회 맵 리스트
	@Override
	@RequestMapping(value = "/hm/p0029/searchList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		searchMap.put("command", request.getParameter("command"));
		List<HM_P0029VO> data = p0029Service.searchList2(searchMap);

		resultMap.put("Data", data);
		System.out.println("resultMap::::" + resultMap);
		return resultMap;
	}

	@Override
	@RequestMapping(value = "/hm/p0029/searchList_TN.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_TN(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		
		int n =  (Integer) accessMap.get("M016");
		System.out.println(accessRange.get(n));
		System.out.println("사원코드"+loginvo.getEmployee_code());
		System.out.println("부서코드"+loginvo.getDepartment_code());
		
		searchMap.put("access_range", accessRange.get(n));
		searchMap.put("Semployee_code",loginvo.getEmployee_code());
		searchMap.put("Sdepartment_code", loginvo.getDepartment_code());
		
		
		searchMap.put("command", request.getParameter("command"));
		searchMap.put("condition", request.getParameter("condition"));

		// 0 : 사업장, 1: 부서
		searchMap.put("Poption_code_temp", request.getParameter("Poption_code_temp"));
		// 사업장 코드 or 부서 코드
		searchMap.put("Poption_code", request.getParameter("Poption_code"));
		// 재직구분 코드
		searchMap.put("WORK_STATUS_CODE", request.getParameter("WORK_STATUS_CODE"));
		// 직급 코드
		searchMap.put("POSITION_CODE", request.getParameter("POSITION_CODE"));
		// 기간 start end
		searchMap.put("date_start", request.getParameter("date_start"));
		searchMap.put("date_end", request.getParameter("date_end"));
		// 교육코드
		searchMap.put("EMPLOYEE_TRAINING_CODE", request.getParameter("EMPLOYEE_TRAINING_CODE"));
		// 퇴사자
		searchMap.put("resigner", request.getParameter("resigner"));

		List<HM_P0029VO> data = p0029Service.searchList_TN(searchMap);
		resultMap.put("Data", data);
		System.out.println("resultMap::::" + resultMap);
		for (Map.Entry<String, Object> entry : searchMap.entrySet()) {
			System.out.println("방법2) key : " + entry.getKey() + " / value : " + entry.getValue());
		}
		System.out.println("=======================");

		return resultMap;
	}

	@Override
	@RequestMapping(value = "/hm/p0029/searchList_BN.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_BN(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		
		int n =  (Integer) accessMap.get("M016");
		System.out.println(accessRange.get(n));
		System.out.println("사원코드"+loginvo.getEmployee_code());
		System.out.println("부서코드"+loginvo.getDepartment_code());
		
		searchMap.put("access_range", accessRange.get(n));
		searchMap.put("Semployee_code",loginvo.getEmployee_code());
		searchMap.put("Sdepartment_code", loginvo.getDepartment_code());
		
		searchMap.put("command", request.getParameter("command"));
		searchMap.put("condition", request.getParameter("condition"));
		// 0 : 사업장, 1: 부서
		searchMap.put("Poption_code_temp", request.getParameter("Poption_code_temp"));
		// 사업장 코드 or 부서 코드
		searchMap.put("Poption_code", request.getParameter("Poption_code"));
		// 재직구분 코드
		searchMap.put("WORK_STATUS_CODE", request.getParameter("WORK_STATUS_CODE"));
		// 직급 코드
		searchMap.put("POSITION_CODE", request.getParameter("POSITION_CODE"));
		// 기간 start end
		searchMap.put("date_start", request.getParameter("date_start"));
		searchMap.put("date_end", request.getParameter("date_end"));
		// 출장국가
		searchMap.put("COUNTRY_CODE", request.getParameter("COUNTRY_CODE"));
		// 퇴사자
		searchMap.put("resigner", request.getParameter("resigner"));

		List<HM_P0029VO> data = p0029Service.searchList_BN(searchMap);
		resultMap.put("Data", data);
		System.out.println("resultMap::::" + resultMap);

		return resultMap;
	}

	@Override
	@RequestMapping(value = "/hm/p0029/searchList_LI.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_LI(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		searchMap.put("command", request.getParameter("command"));
		searchMap.put("condition", request.getParameter("condition"));
		HttpSession session = request.getSession(); 
		LoginVO loginvo = new LoginVO();
		loginvo = (LoginVO)session.getAttribute("login"); 
		
		Map<String, Object> accessMap = new HashMap<String, Object>();
		ArrayList<String> accessRange = new ArrayList<String>();		
		accessRange = (ArrayList<String>) session.getAttribute("access_range"); 
		accessMap = (Map<String, Object>) session.getAttribute("accessnum");	
		
		int n =  (Integer) accessMap.get("M016");
		System.out.println(accessRange.get(n));
		System.out.println("사원코드"+loginvo.getEmployee_code());
		System.out.println("부서코드"+loginvo.getDepartment_code());
		
		searchMap.put("access_range", accessRange.get(n));
		searchMap.put("Semployee_code",loginvo.getEmployee_code());
		searchMap.put("Sdepartment_code", loginvo.getDepartment_code());

		// 0 : 사업장, 1: 부서
		searchMap.put("Poption_code_temp", request.getParameter("Poption_code_temp"));
		// 사업장 코드 or 부서 코드
		searchMap.put("Poption_code", request.getParameter("Poption_code"));
		// 재직구분 코드
		searchMap.put("WORK_STATUS_CODE", request.getParameter("WORK_STATUS_CODE"));
		// 직급 코드
		searchMap.put("POSITION_CODE", request.getParameter("POSITION_CODE"));
		// 자격증
		searchMap.put("LICENSE_CODE", request.getParameter("LICENSE_CODE"));
		// 퇴사자
		searchMap.put("resigner", request.getParameter("resigner"));

		List<HM_P0029VO> data = p0029Service.searchList_LI(searchMap);
		resultMap.put("Data", data);
		System.out.println("resultMap::::" + resultMap);

		return resultMap;
	}

	@Override
	@RequestMapping(value = "/hm/p0029/searchList_LA.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_LA(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		searchMap.put("command", request.getParameter("command"));
		searchMap.put("condition", request.getParameter("condition"));
		HttpSession session = request.getSession(); 
		LoginVO loginvo = new LoginVO();
		loginvo = (LoginVO)session.getAttribute("login"); 
		
		Map<String, Object> accessMap = new HashMap<String, Object>();
		ArrayList<String> accessRange = new ArrayList<String>();		
		accessRange = (ArrayList<String>) session.getAttribute("access_range"); 
		accessMap = (Map<String, Object>) session.getAttribute("accessnum");	
		
		int n =  (Integer) accessMap.get("M016");
		System.out.println(accessRange.get(n));
		System.out.println("사원코드"+loginvo.getEmployee_code());
		System.out.println("부서코드"+loginvo.getDepartment_code());
		
		searchMap.put("access_range", accessRange.get(n));
		searchMap.put("Semployee_code",loginvo.getEmployee_code());
		searchMap.put("Sdepartment_code", loginvo.getDepartment_code());

		// 0 : 사업장, 1: 부서
		searchMap.put("Poption_code_temp", request.getParameter("Poption_code_temp"));
		// 사업장 코드 or 부서 코드
		searchMap.put("Poption_code", request.getParameter("Poption_code"));
		// 재직구분 코드
		searchMap.put("WORK_STATUS_CODE", request.getParameter("WORK_STATUS_CODE"));
		// 직급 코드
		searchMap.put("POSITION_CODE", request.getParameter("POSITION_CODE"));
		// 어학시험
		searchMap.put("LANGUAGE_CODE", request.getParameter("LANGUAGE_CODE"));
		// 퇴사자
		searchMap.put("resigner", request.getParameter("resigner"));

		List<HM_P0029VO> data = p0029Service.searchList_LA(searchMap);
		resultMap.put("Data", data);
		System.out.println("resultMap::::" + resultMap);

		return resultMap;
	}
}
