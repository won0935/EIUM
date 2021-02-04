package com.myspring.eium.sm.sm_p0006.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.sm.sm_p0003.vo.SM_P0003VO;
import com.myspring.eium.sm.sm_p0006.dao.SM_P0006DAO;
import com.myspring.eium.sm.sm_p0006.vo.SM_P0006VO;


@Service
@Transactional(propagation = Propagation.REQUIRED)
public class SM_P0006ServiceImpl implements SM_P0006Service {
	@Autowired
	private SM_P0006DAO sM_P0006DAO;
	
	@Override
	public List<SM_P0006VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0006VO> list =  sM_P0006DAO.searchList(searchMap); 
		return list;
	}

	@Override
	public List<SM_P0006VO> searchSiteList(Map<String, Object> searchMap) {
		List<SM_P0006VO> list=sM_P0006DAO.searchSiteList(searchMap);

		return list;
	}

	@Override
	public List<SM_P0006VO> searchDeptList(Map<String, Object> searchMap) {
		List<SM_P0006VO> list=sM_P0006DAO.searchDeptList(searchMap);

		return list;
	}

}
