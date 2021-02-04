package com.myspring.eium.wm.wm_p0004.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.wm.wm_p0004.vo.WM_P0004VO;

public interface WM_P0004Service {
	 public List<WM_P0004VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public List<WM_P0004VO> searchEmployeeList(Map<String, Object> searchMap);
	 public List<WM_P0004VO> searchCountryList(Map<String, Object> searchMap);
	 public void saveData(Map<String, String[]> dataMap, String x, String user) throws DataAccessException;
}
