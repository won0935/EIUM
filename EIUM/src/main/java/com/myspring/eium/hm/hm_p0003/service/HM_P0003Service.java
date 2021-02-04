package com.myspring.eium.hm.hm_p0003.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myspring.eium.hm.hm_p0003.vo.HM_P0003VO;


public interface HM_P0003Service {
	 public List<HM_P0003VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void saveData(Map<String, String[]> dataMap,String t_name)  throws DataAccessException ;

	public List<HM_P0003VO> searchList2(Map<String, String> searchMap) throws DataAccessException;
}
