package com.myspring.eium.hm.hm_p0029.controller;




import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.eium.hm.hm_p0029.vo.HM_P0029VO;

public interface HM_P0029Controller {
	//첫 모델엔뷰
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchInit_TN(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchInit_BN(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchInit_LI(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchInit_LA(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//사업장 팝업 모델엔뷰
	public ModelAndView search_Site(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchList_site(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//부서 팝업 모델엔뷰
	public ModelAndView search_Dept(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//table명으로 popup창 띄우기
	public ModelAndView findPopup(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//popup 창 띄우기 위한 맵 리스트
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//조건에 따른 교육 조회
	public Map searchList_TN(HttpServletRequest request, HttpServletResponse response) throws Exception;	
	//조건에 따른 출장 조회
	public Map searchList_BN(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//조건에 따른 자격/면허 조회
	public Map searchList_LI(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//조건에 따른 어학시험 조회
	public Map searchList_LA(HttpServletRequest request, HttpServletResponse response) throws Exception;	
	
}