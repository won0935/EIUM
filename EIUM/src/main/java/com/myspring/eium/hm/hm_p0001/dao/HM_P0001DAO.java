package com.myspring.eium.hm.hm_p0001.dao;



import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0001.vo.HM_P0001VO;

public interface HM_P0001DAO {
	public List<HM_P0001VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void DATE_deleteData(Map<String, String> row) throws DataAccessException;
	 
	public void DATE_updateData(Map<String, String> row) throws DataAccessException;
	
	public void SALARY_updateData(Map<String, String> row) throws DataAccessException;
	
	public void BACKDATE_updateData(Map<String, String> row) throws DataAccessException;

	public List<HM_P0001VO> searchList2(Map<String, String> searchMap) throws DataAccessException;
	
	public List<HM_P0001VO> searchList3(Map<String, String> searchMap) throws DataAccessException;
}
