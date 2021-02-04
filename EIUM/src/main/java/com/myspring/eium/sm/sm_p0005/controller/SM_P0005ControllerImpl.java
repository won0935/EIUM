package com.myspring.eium.sm.sm_p0005.controller;

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

import com.myspring.eium.login.vo.LoginVO;
import com.myspring.eium.sm.sm_p0005.service.SM_P0005Service;
import com.myspring.eium.sm.sm_p0005.vo.SM_P0005VO;



@Controller
public class SM_P0005ControllerImpl implements SM_P0005Controller{
	private static final Logger logger = LoggerFactory.getLogger(SM_P0005ControllerImpl.class);
	
	@Autowired
	SM_P0005Service sM_P0005Service;
	@Autowired
	SM_P0005VO sM_P0005VO;
	
	@Override
	@RequestMapping(value = "/sm/p0005/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("sm/sm_p0005/p0005");
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/sm/p0005/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();

		searchMap.put("p_employee__code", request.getParameter("p_employee__code"));
		
		List<SM_P0005VO> data = sM_P0005Service.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/sm/p0005/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // ������ Data
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ó�����
		
		HttpSession session = request.getSession(); LoginVO loginvo = new LoginVO();
		loginvo = (LoginVO)session.getAttribute("login"); 
		String user= (loginvo.getEmployee_id());
		
		String x = request.getParameter("x");
		//세션을 이용한 작성자, 수정자 입력
//		HttpSession session = request.getSession();
//	    LoginVO loginvo = new LoginVO();
//	    loginvo = (LoginVO)session.getAttribute("login");
//	    String user= (loginvo.getEmployee_name());
		
		// ���� Data �����ϱ�
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		/*try {
			p0005Service.saveData(dataMap);	
			result.put("Code","0");
			result.put("Message","����Ǿ����ϴ�");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","���忡 �����Ͽ����ϴ�");
			e.printStackTrace();
		}*/
		sM_P0005Service.saveData(dataMap, x, user);	
		resultMap.put("Result", result);         
        return resultMap;
	}
	
}
