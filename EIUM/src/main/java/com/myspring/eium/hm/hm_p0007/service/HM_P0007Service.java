package com.myspring.eium.hm.hm_p0007.service;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0007.vo.HM_P0007VO;




public interface HM_P0007Service {
	 public List<HM_P0007VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	public void saveData(Map<String, String[]> dataMap, String u, String x)  throws DataAccessException ;
	public List<HM_P0007VO> licenseList(Map<String, Object> searchMap) throws DataAccessException ;
	public List<HM_P0007VO> assessmentList(Map<String, Object> searchMap) throws DataAccessException ;
	public List<HM_P0007VO> rnpList(Map<String, Object> searchMap) throws DataAccessException ;
	public List<HM_P0007VO> languageList(Map<String, Object> searchMap) throws DataAccessException ;


}
