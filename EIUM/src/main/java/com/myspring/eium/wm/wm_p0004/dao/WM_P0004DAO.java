package com.myspring.eium.wm.wm_p0004.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.wm.wm_p0004.vo.WM_P0004VO;


public interface WM_P0004DAO {

	public List<WM_P0004VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	public List<WM_P0004VO> searchEmployeeList(Map<String, Object> searchMap) throws DataAccessException;
	public List<WM_P0004VO> searchCountryList(Map<String, Object> searchMap) throws DataAccessException;
	public void updateData(Map<String, String> row) throws DataAccessException;
	public void updateData2(Map<String, String> row) throws DataAccessException;
	public void deleteData(Map<String, String> row) throws DataAccessException;

}
