package com.myspring.eium.hm.hm_p0018.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0018.vo.HM_P0018VO;

public interface HM_P0018Service {

	public List<HM_P0018VO> searchList(Map<String, Object> searchMap)throws DataAccessException;


	List<HM_P0018VO> emplyoeeListSearch(Map<String, Object> searchMap) throws DataAccessException;
	
	

	public List<HM_P0018VO> employeeSearch(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0018VO> autocomplete(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0018VO> searchList2(Map<String, Object> searchMap) throws DataAccessException;


	public void emplyoeeListsaveData(Map<String, String[]> dataMap, String param, String user);

	void saveData(Map<String, String[]> dataMap, String u) throws DataAccessException;

}
