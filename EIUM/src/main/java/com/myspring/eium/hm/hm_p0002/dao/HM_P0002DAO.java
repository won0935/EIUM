package com.myspring.eium.hm.hm_p0002.dao;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0002.vo.HM_P0002VO;


public interface HM_P0002DAO {
	public List<HM_P0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	public void insertData(Map<String, String> row) throws DataAccessException;
	public void updateData(Map<String, String> row) throws DataAccessException;
	public void deleteData(Map<String, String> row) throws DataAccessException;
	public void insertselect(Map<String, String> row2) throws DataAccessException;
	public void updateselect(Map<String, String> row2) throws DataAccessException;
	public void deleteselect(Map<String, String> row2) throws DataAccessException;
	public List<HM_P0002VO> searchSiteList(Map<String, Object> searchMap) throws DataAccessException;
	public List<HM_P0002VO> searchJobclassList(Map<String, Object> searchMap) throws DataAccessException;
	public List<HM_P0002VO> searchSelect(Map<String, Object> searchMap)throws DataAccessException;



	 
}
