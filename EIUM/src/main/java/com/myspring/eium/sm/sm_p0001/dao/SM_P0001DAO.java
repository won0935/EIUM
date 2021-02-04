package com.myspring.eium.sm.sm_p0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.sm.sm_p0001.vo.SM_P0001VO;


public interface SM_P0001DAO {
	 	public List<SM_P0001VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

		public void insertData(Map<String, String> row) throws DataAccessException;

		public void updateData(Map<String, String> row) throws DataAccessException;

		public void deleteData(Map<String, String> row) throws DataAccessException;
}
