package com.myspring.eium.wm.wm_p0001.dao;



import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.wm.wm_p0001.vo.WM_P0001VO;





public interface WM_P0001DAO {
	public List<WM_P0001VO> EMP_searchList(Map<String, Object> searchMap) throws DataAccessException;
	public List<WM_P0001VO> WS_searchList(Map<String, String> searchMap) throws DataAccessException;
	public List<WM_P0001VO> TWS_searchList(Map<String, String> searchMap) throws DataAccessException;

	public void TWS_insertData(Map<String, String> row) throws DataAccessException;
	
	public void WS_YN_updateData(Map<String, String> row) throws DataAccessException;
	
	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;
	public void WS_YN_rollbackData(Map<String, String> row)throws DataAccessException;
	
	 
}
