package com.myspring.eium.pm.pm_p0002.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.pm.pm_p0002.vo.PM_P0002VO;

public interface PM_P0002Service {
	public void saveData(Map<String, String[]> dataMap, String user, String x, String y)  throws DataAccessException ;
	public List<PM_P0002VO> paydate_searchList(Map<String, Object> searchMap) throws DataAccessException;
	public List<PM_P0002VO> searchTypeList(Map<String, Object> searchMap) throws DataAccessException;
	public List<PM_P0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	public List<PM_P0002VO> searchReceipt(Map<String, Object> searchMap)throws DataAccessException;
	public List<PM_P0002VO> paygrade_searchData(Map<String, Object> searchMap)throws DataAccessException;

}
