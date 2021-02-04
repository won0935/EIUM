package com.myspring.eium.pm.pm_p0002.dao;



import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.pm.pm_p0002.vo.PM_P0002VO;




public interface PM_P0002DAO {
	public List<PM_P0002VO> typeList(Map<String, Object> searchMap) throws DataAccessException;
	public List<PM_P0002VO> paydate_searchList(Map<String, Object> searchMap)throws DataAccessException;
	public List<PM_P0002VO> searchList(Map<String, Object> searchMap)throws DataAccessException;

	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;
	public List<PM_P0002VO> searchReceipt(Map<String, Object> searchMap)throws DataAccessException;
	public List<PM_P0002VO> paygradeList(Map<String, Object> searchMap)throws DataAccessException;

	
	 
}
