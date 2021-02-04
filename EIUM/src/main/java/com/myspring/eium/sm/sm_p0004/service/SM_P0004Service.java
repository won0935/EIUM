package com.myspring.eium.sm.sm_p0004.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.sm.sm_p0003.vo.SM_P0003VO;
import com.myspring.eium.sm.sm_p0004.vo.SM_P0004VO;

public interface SM_P0004Service {
//	 public List listMembers() throws DataAccessException;
//	 public int removeMember(String id) throws DataAccessException;
//	 public p0005VO login(p0005VO p0005VO) throws Exception;
	 
	 public List<SM_P0004VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public List<SM_P0004VO> companyList(Map<String, Object> searchMap) throws DataAccessException;

     public void saveData(Map<String, String[]> dataMap, String user)  throws DataAccessException;
}
