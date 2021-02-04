package com.myspring.eium.pm.pm_p0001.dao;



import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.pm.pm_p0001.vo.PM_P0001VO;




public interface PM_P0001DAO {
	public List<PM_P0001VO> typeList(Map<String, Object> searchMap) throws DataAccessException;
	public List<PM_P0001VO> paydate_searchList(Map<String, Object> searchMap)throws DataAccessException;
	public List<PM_P0001VO> searchList(Map<String, Object> searchMap)throws DataAccessException;

	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;
	public List<PM_P0001VO> searchReceipt(Map<String, Object> searchMap)throws DataAccessException;
	public List<PM_P0001VO> paygradeList(Map<String, Object> searchMap)throws DataAccessException;

	
	 
}
