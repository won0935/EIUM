package com.myspring.eium.hm.hm_p0022.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0022.vo.HM_P0022VO;

public interface HM_P0022DAO {

	List<HM_P0022VO> appointList(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> appointList2(Map<String, Object> searchMap) throws DataAccessException;

	void insertData1(Map<String, String> row) throws DataAccessException ;

	void updateData1(Map<String, String> row) throws DataAccessException;

	void deleteData1(Map<String, String> row) throws DataAccessException;

	List<HM_P0022VO> masterEmployee_p02(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> homeEmployeeSearch(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> homeSearch_p03(Map<String, Object> searchMap) throws DataAccessException;

	void insertData2(Map<String, String> row) throws DataAccessException;

	void updateData2(Map<String, String> row) throws DataAccessException;

	void deleteData2(Map<String, String> row) throws DataAccessException;

	List<HM_P0022VO> homeSearch_p02(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> homeSearch_p04(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> homeSearch_p05(Map<String, Object> searchMap) throws DataAccessException;

	void updateData3(Map<String, String> row) throws DataAccessException;

	void updateData4(Map<String, String> row) throws DataAccessException;

	List<HM_P0022VO> appointList3(Map<String, Object> searchMap) throws DataAccessException;




}
