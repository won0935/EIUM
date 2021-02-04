package com.myspring.eium.pm.pm_p0010.service;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.pm.pm_p0010.dao.PM_P0010DAO;
import com.myspring.eium.pm.pm_p0010.vo.PM_P0010VO;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class PM_P0010ServiceImpl implements PM_P0010Service {
	@Autowired
	private PM_P0010DAO p0010DAO;

	@Override
	public List<PM_P0010VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0010VO> list =  p0010DAO.searchList(searchMap); 
		return list;
	}
	@Override
	public List<PM_P0010VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0010VO> list =  p0010DAO.searchList2(searchMap); 
		return list;
	}
	@Override
	public List<PM_P0010VO> searchList3(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0010VO> list =  p0010DAO.searchList3(searchMap); 
		return list;
	}

	
}
