package com.myspring.eium.hm.hm_p0007.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.hm.hm_p0007.dao.HM_P0007_07DAO;
import com.myspring.eium.hm.hm_p0007.vo.HM_P0007_07VO;






@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0007_07ServiceImpl implements HM_P0007_07Service {
	@Autowired
	private HM_P0007_07DAO p0007_07DAO;

	@Override
	public List<HM_P0007_07VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0007_07VO> list =  p0007_07DAO.searchList(searchMap); 
		return list;
	}

	
	

}
