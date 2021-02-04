package com.myspring.eium.pm.pm_p0003.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.pm.pm_p0003.vo.PM_P0003VO;

public interface PM_P0003Service {
	public void saveData(Map<String, String[]> dataMap, String user, String x, String y)  throws DataAccessException ;
	public List<PM_P0003VO> paydate_searchList(Map<String, Object> searchMap) throws DataAccessException;
	public List<PM_P0003VO> searchTypeList(Map<String, Object> searchMap) throws DataAccessException;
	public List<PM_P0003VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	public List<PM_P0003VO> searchReceipt(Map<String, Object> searchMap)throws DataAccessException;
	public List<PM_P0003VO> paygrade_searchData(Map<String, Object> searchMap)throws DataAccessException;

}
