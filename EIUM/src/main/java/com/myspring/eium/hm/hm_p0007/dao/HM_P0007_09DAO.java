package com.myspring.eium.hm.hm_p0007.dao;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0007.vo.HM_P0007_09VO;


public interface HM_P0007_09DAO {
	 public List<HM_P0007_09VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public void insertData(Map<String, String> row) throws DataAccessException;
	 public void updateData(Map<String, String> row) throws DataAccessException;
	 public void deleteData(Map<String, String> row) throws DataAccessException;

	
}
