package com.myspring.eium.hm.hm_p0004.service;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myspring.eium.hm.hm_p0004.vo.HM_P0004VO;

public interface HM_P0004Service {
	public List<HM_P0004VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	public void saveData(Map<String, String[]> dataMap) throws DataAccessException;
	public List<HM_P0004VO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
	public void saveFile(Map<String,Object> dataMap);
	public List<HM_P0004VO> searchContract(Map<String, Object> searchMap) throws DataAccessException;
	public void saveData2(Map<String, String[]> dataMap, String empCode) throws DataAccessException;
	

}
