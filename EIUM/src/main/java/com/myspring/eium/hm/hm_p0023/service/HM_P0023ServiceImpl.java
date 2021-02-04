package com.myspring.eium.hm.hm_p0023.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import com.myspring.eium.hm.hm_p0023.dao.HM_P0023DAO;
import com.myspring.eium.hm.hm_p0023.vo.HM_P0023VO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0023ServiceImpl implements HM_P0023Service{

	@Autowired
	private HM_P0023DAO hM_P0023DAO;
	
	@Override
	public List<HM_P0023VO> appointList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0023VO> list =  hM_P0023DAO.appointList(searchMap); 
		return list;
	}
	

	}
	
