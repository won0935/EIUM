package com.myspring.eium.sm.sm_p0005.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.sm.sm_p0005.vo.SM_P0005VO;

public interface SM_P0005Service {
	 public List<SM_P0005VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
     public void saveData(Map<String, String[]> dataMap, String x, String user)  throws DataAccessException;
}
