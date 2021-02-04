package com.myspring.eium.hm.hm_p0033.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.hm.hm_p0033.dao.HM_P0033DAO;
import com.myspring.eium.hm.hm_p0033.vo.HM_P0033VO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0033ServiceImpl implements HM_P0033Service {
	@Autowired
	private HM_P0033DAO p0033DAO;


	
	@Override
	public List<HM_P0033VO> hr_assessment_List(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list =  p0033DAO.hr_assessment_List(searchMap); 
		return list;
	}
	
	@Override
	public List<HM_P0033VO> hr_rnp_List(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list =  p0033DAO.hr_rnp_List(searchMap); 
		return list;
	}
	
	@Override
	public List<HM_P0033VO> site_List(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list =  p0033DAO.site_List(searchMap); 
		return list;
	}
	
	@Override
	public List<HM_P0033VO> employee_List(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list =  p0033DAO.employee_List(searchMap); 
		return list;
	}
	
	@Override
	public List<HM_P0033VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list =  p0033DAO.searchList(searchMap); 
		return list;
	}
	
	@Override
	public List<HM_P0033VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list =  p0033DAO.searchList2(searchMap); 
		return list;
	}
	

	

	
}
