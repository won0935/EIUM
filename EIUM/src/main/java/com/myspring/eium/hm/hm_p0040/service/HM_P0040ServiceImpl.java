package com.myspring.eium.hm.hm_p0040.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.hm.hm_p0040.dao.HM_P0040DAO;
import com.myspring.eium.hm.hm_p0040.vo.HM_P0040VO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0040ServiceImpl implements HM_P0040Service {
	
	@Autowired
	private HM_P0040DAO hM_P0040DAO;

	@Override
	public List<HM_P0040VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0040VO> list =  hM_P0040DAO.searchList(searchMap); 
		return list;
	}

	@Override
	public List<HM_P0040VO> searchEmployee(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0040VO> list =  hM_P0040DAO.searchEmployee(searchMap); 
		return list;
	}

	@Override
	public List<HM_P0040VO> searchEmployeeList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0040VO> list =  hM_P0040DAO.searchEmployeeList(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0040VO> searchTraining(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0040VO> list =  hM_P0040DAO.searchTraining(searchMap); 
		return list;
	}

	


}
