package com.myspring.eium.pm.pm_p0004.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.pm.pm_p0004.vo.PM_P0004VO;

public interface PM_P0004Service {
	public void saveData(Map<String, String[]> dataMap, String user, String x, String y)  throws DataAccessException ;
	public List<PM_P0004VO> paydate_searchList(Map<String, Object> searchMap) throws DataAccessException;
	public List<PM_P0004VO> searchTypeList(Map<String, Object> searchMap) throws DataAccessException;
	public List<PM_P0004VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	public List<PM_P0004VO> searchReceipt(Map<String, Object> searchMap)throws DataAccessException;
	public List<PM_P0004VO> paygrade_searchData(Map<String, Object> searchMap)throws DataAccessException;
	public List<PM_P0004VO> BankList(Map<String, Object> searchMap)throws DataAccessException;

}
