package com.myspring.eium.hm.hm_p0029.service;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myspring.eium.hm.hm_p0029.vo.HM_P0029VO;
import com.myspring.eium.hm.hm_p0029.vo.HM_P0029VO;

public interface HM_P0029Service {
	//팝업 도움 코드 (전체)
	public List<HM_P0029VO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<HM_P0029VO> searchList_site(Map<String, Object> searchMap) throws DataAccessException;
	//TN 교육 검색
	public List<HM_P0029VO> searchList_TN(Map<String, Object> searchMap) throws DataAccessException;
	//BN 출장 검색
	public List<HM_P0029VO> searchList_BN(Map<String, Object> searchMap) throws DataAccessException;
	//LI 자격/면허 검색
	public List<HM_P0029VO> searchList_LI(Map<String, Object> searchMap) throws DataAccessException;
	//LA 어학시험 검색
	public List<HM_P0029VO> searchList_LA(Map<String, Object> searchMap) throws DataAccessException;
}
