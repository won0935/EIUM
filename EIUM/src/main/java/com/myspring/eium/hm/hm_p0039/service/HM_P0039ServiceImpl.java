package com.myspring.eium.hm.hm_p0039.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.hm.hm_p0039.dao.HM_P0039DAO;
import com.myspring.eium.hm.hm_p0039.vo.HM_P0039VO;


@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0039ServiceImpl implements HM_P0039Service{
	
	@Autowired
	private HM_P0039DAO hM_P0039DAO;
	
	@Override
	public List<HM_P0039VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0039VO> list =  hM_P0039DAO.searchList(searchMap); 
		return list;
	}

}
