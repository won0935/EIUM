package com.myspring.eium.hm.hm_p0001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0001.vo.HM_P0001VO;

public interface HM_P0001Service {
	public List<HM_P0001VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void saveData(Map<String, String[]> dataMap, String p_position_CODE, String PP_START_DATE, String u)  throws DataAccessException ;
	
	public void SALARY_saveData(Map<String, String[]> dataMap, String p_position_CODE, String PP_START_DATE, String u)  throws DataAccessException ;
	
	public void DATE_deleteData(Map<String, String[]> dataMap, String p_position_CODE, String PP_START_DATE, String u)  throws DataAccessException ;

	public List<HM_P0001VO> searchList2(Map<String, String> searchMap) throws DataAccessException;
	
	public List<HM_P0001VO> searchList3(Map<String, String> searchMap) throws DataAccessException;
}
