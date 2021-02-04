package com.myspring.eium.hm.hm_p0022.service;

import java.util.List;
import java.util.Map;

import org.json.simple.parser.ParseException;
import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0022.vo.HM_P0022VO;

public interface HM_P0022Service {

	List<HM_P0022VO> appointList(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> appointList2(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> masterEmployee_p02(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> homeEmployeeSearch(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> homeSearch_p03(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> homeSearch_p02(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> homeSearch_p04(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> homeSearch_p05(Map<String, Object> searchMap) throws DataAccessException;


	List<HM_P0022VO> appointList3(Map<String, Object> searchMap) throws DataAccessException;

	void saveData1(Map<String, String[]> dataMap, String u) throws DataAccessException;


	void saveData3(Map<String, String[]> dataMap, String u) throws DataAccessException;

	void saveData4(Map<String, String[]> dataMap, String u) throws DataAccessException;

	void saveData2(Map<String, String[]> dataMap, String u, String appointCode) throws DataAccessException;





}
