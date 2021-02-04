package com.myspring.eium.hm.hm_p0002.service;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0002.vo.HM_P0002VO;




public interface HM_P0002Service {
	public List<HM_P0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	public void saveData(Map<String, String[]> dataMap, String user) throws DataAccessException;
	public List<HM_P0002VO> searchSiteList(Map<String, Object> searchMap) throws DataAccessException;
	public List<HM_P0002VO> searchJobclassList(Map<String, Object> searchMap) throws DataAccessException;
	public List<HM_P0002VO> searchSelect(Map<String, Object> searchMap) throws DataAccessException;
	public void saveSelect(Map<String, String[]> dataMap, String user, String x) throws DataAccessException;

	
}
