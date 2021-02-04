package com.myspring.eium.login.controller;


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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.eium.login.service.LoginService;
import com.myspring.eium.login.vo.LoginVO;




@Controller
public class LoginControllerImpl   implements LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginControllerImpl.class);
	@Autowired
	private LoginService loginService;
	@Autowired
	LoginVO loginVO ;
	

	/*
	 * private String getViewName(HttpServletRequest request) throws Exception {
	 * String contextPath = request.getContextPath(); String uri = (String)
	 * request.getAttribute("javax.servlet.include.request_uri"); if (uri == null ||
	 * uri.trim().equals("")) { uri = request.getRequestURI(); }
	 * 
	 * int begin = 0; if (!((contextPath == null) || ("".equals(contextPath)))) {
	 * begin = contextPath.length(); }
	 * 
	 * int end; if (uri.indexOf(";") != -1) { end = uri.indexOf(";"); } else if
	 * (uri.indexOf("?") != -1) { end = uri.indexOf("?"); } else { end =
	 * uri.length(); }
	 * 
	 * String viewName = uri.substring(begin, end); if (viewName.indexOf(".") != -1)
	 * { viewName = viewName.substring(0, viewName.lastIndexOf(".")); } if
	 * (viewName.lastIndexOf("/") != -1) { viewName =
	 * viewName.substring(viewName.lastIndexOf("/",1), viewName.length()); } return
	 * viewName; }
	 */

	
	@Override
	@RequestMapping(value = "/LoginCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView appointList(@ModelAttribute("login") LoginVO login, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();

		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> accessMap = new HashMap<String, Object>(); // 검색조건


		int i;
		ArrayList<String> menuList = new ArrayList<String>();
		ArrayList<String> accessRange = new ArrayList<String>();

	
		searchMap.put("employee_id", login.getEmployee_id());
		searchMap.put("employee_password", login.getEmployee_password());
		
		List<LoginVO> data = loginService.searchList(searchMap);
		try {
			if(data.get(0).getAccess_grant() != null && !data.get(0).getAccess_grant().equals("")) {
				
			}
			

	    	if(data != null && data.isEmpty() != true) {
	    		HttpSession session = request.getSession();
	    		
	    		
	    		for(i=0; i<data.size(); i++) {
	    			accessMap.put(data.get(i).getMenu_code() , i);
	    			 menuList.add(data.get(i).getMenu_code());
	    			 accessRange.add(data.get(i).getAccess_range());

	    		}
	    		menuList.sort(null);
	    
	   		
	    		session.setAttribute("accessnum", accessMap);
	    		session.setAttribute("menu_code", menuList);
	    		session.setAttribute("access_range", accessRange);
	    		session.setAttribute("authority_code", data.get(0).getAuthority_code());

	    		session.setAttribute("login", data.get(0));
	    		session.setAttribute("isLogOn", true);
	    		
	    		mav.setViewName("redirect:/main.do");
	    		}

			
		} catch (Exception e) {

	     

				mav.addObject("result", "false");
	            mav.setViewName("redirect:/login.do");


		}
		return mav;

	}

}
