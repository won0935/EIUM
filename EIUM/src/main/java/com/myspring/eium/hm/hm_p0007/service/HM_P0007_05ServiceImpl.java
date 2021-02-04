package com.myspring.eium.hm.hm_p0007.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.hm.hm_p0007.dao.HM_P0007_05DAO;
import com.myspring.eium.hm.hm_p0007.vo.HM_P0007_05VO;






@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0007_05ServiceImpl implements HM_P0007_05Service {
	@Autowired
	private HM_P0007_05DAO p0007_05DAO;

	@Override
	public List<HM_P0007_05VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0007_05VO> list =  p0007_05DAO.searchList(searchMap); 
		return list;
	}

	
	

}
