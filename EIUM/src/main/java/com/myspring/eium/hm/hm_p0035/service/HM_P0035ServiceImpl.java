package com.myspring.eium.hm.hm_p0035.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.hm.hm_p0035.dao.HM_P0035DAOImpl;
import com.myspring.eium.hm.hm_p0035.vo.HM_P0035VO;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0035ServiceImpl implements HM_P0035Service {
	@Autowired
	private HM_P0035DAOImpl HM_P0035DAO;
	
	@Override
	public List<HM_P0035VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0035VO> list =  HM_P0035DAO.searchList(searchMap); 
		return list;
	}

	@Override
	public List<HM_P0035VO> searchSiteList(Map<String, Object> searchMap) {
		List<HM_P0035VO> list=HM_P0035DAO.searchSiteList(searchMap);

		return list;
	}

	@Override
	public List<HM_P0035VO> searchDeptList(Map<String, Object> searchMap) {
		List<HM_P0035VO> list=HM_P0035DAO.searchDeptList(searchMap);

		return list;
	}

}
