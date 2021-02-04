package com.myspring.eium.pm.pm_p0001.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myspring.eium.pm.pm_p0001.vo.PM_P0001VO;

public interface PM_P0001Service {
	public void saveData(Map<String, String[]> dataMap, String user, String x, String y)  throws DataAccessException ;
	public List<PM_P0001VO> paydate_searchList(Map<String, Object> searchMap) throws DataAccessException;
	public List<PM_P0001VO> searchTypeList(Map<String, Object> searchMap) throws DataAccessException;
	public List<PM_P0001VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	public List<PM_P0001VO> searchReceipt(Map<String, Object> searchMap)throws DataAccessException;
	public List<PM_P0001VO> paygrade_searchData(Map<String, Object> searchMap)throws DataAccessException;

}
