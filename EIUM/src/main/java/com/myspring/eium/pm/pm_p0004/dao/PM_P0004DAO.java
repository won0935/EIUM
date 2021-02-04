package com.myspring.eium.pm.pm_p0004.dao;



import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.pm.pm_p0004.vo.PM_P0004VO;




public interface PM_P0004DAO {
	public List<PM_P0004VO> typeList(Map<String, Object> searchMap) throws DataAccessException;
	public List<PM_P0004VO> paydate_searchList(Map<String, Object> searchMap)throws DataAccessException;
	public List<PM_P0004VO> searchList(Map<String, Object> searchMap)throws DataAccessException;

	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;
	public List<PM_P0004VO> searchReceipt(Map<String, Object> searchMap)throws DataAccessException;
	public List<PM_P0004VO> paygradeList(Map<String, Object> searchMap)throws DataAccessException;
	public List<PM_P0004VO> BankList(Map<String, Object> searchMap)throws DataAccessException;

	
	 
}
