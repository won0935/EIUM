package com.myspring.eium.hm.hm_p0004.controller;



import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.imageio.stream.FileImageOutputStream;
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
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.eium.hm.hm_p0004.dao.HM_P0004DAO;
import com.myspring.eium.hm.hm_p0004.service.HM_P0004Service;
import com.myspring.eium.hm.hm_p0004.vo.HM_P0004VO;

@Controller
public class HM_P0004ControllerImpl implements HM_P0004Controller {
	private static final Logger logger = LoggerFactory.getLogger(HM_P0004ControllerImpl.class);

	@Autowired
	HM_P0004Service p0004Service;
	@Autowired
	HM_P0004DAO p0004dao;

	
	
	@Override
	@RequestMapping(value = "/hm/p0004/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0004/p0004_home");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0004/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		searchMap.put("command", request.getParameter("command"));
		searchMap.put("condition", request.getParameter("condition"));
		List<HM_P0004VO> data = p0004Service.searchList(searchMap);
        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
    	
        return resultMap;
	}
		
	@Override
	@RequestMapping(value = "/hm/p0004/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
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
			p0004Service.saveData(dataMap);	
			result.put("Code","0");
			result.put("Message","저장성공");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","저장실패");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result);         
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0004/saveData2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		String empCode = request.getParameter("empCode");
	
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			p0004Service.saveData2(dataMap, empCode);
			result.put("Code","0");
			result.put("Message","저장성공");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","저장실패");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result);         
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0004/findAddress.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findAddress(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/hm/hm_p0004/p0004_home_p01");
		return mav;

	}
	@Override
	@RequestMapping(value = "/hm/p0004/findPopup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findPopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/hm/hm_p0004/p0004_home_p02");
		mav.addObject("command", request.getParameter("command"));
		mav.addObject("index", request.getParameter("index"));
		return mav;
	}
	@Override
	@RequestMapping(value = "/hm/p0004/searchList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		searchMap.put("command", request.getParameter("command"));
		List<HM_P0004VO> data = p0004Service.searchList2(searchMap);

        resultMap.put("Data", data);
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0004/searchContract.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchContract(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		searchMap.put("empCode", request.getParameter("empCode"));
		List<HM_P0004VO> data = p0004Service.searchContract(searchMap);

        resultMap.put("Data", data);
        return resultMap;
	}
	
	@Override
    @RequestMapping(value="/hm/p0004/saveFile.do", method = { RequestMethod.GET, RequestMethod.POST })
    public void saveFile(HM_P0004VO VO, ModelAndView mav, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>(); 
		
        dataMap.put("emp_CODE",VO.getEmp_CODE());
        dataMap.put("picture",VO.getPicture().getBytes());
        
		try {
			p0004Service.saveFile(dataMap);
		}catch(Exception e) {
			e.printStackTrace();
		}
	
    }
	
	@Override
	@RequestMapping(value = "/hm/p0004/getByteImage.do")
	@ResponseBody
	public ResponseEntity<byte[]> getByteImage(HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("emp_CODE",request.getParameter("empCode"));
		
		Map<String, Object> map = p0004dao.getByteImage(searchMap);
		
		byte[] imageContent = (byte[]) map.get("picture");

		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
	}
	
}
