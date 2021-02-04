package com.myspring.eium.hm.hm_p0003.dao;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0003.vo.HM_P0003VO;


public interface HM_P0003DAO {
	 public List<HM_P0003VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;

	public List<HM_P0003VO> searchList2(Map<String, String> searchMap) throws DataAccessException;
	 
}
