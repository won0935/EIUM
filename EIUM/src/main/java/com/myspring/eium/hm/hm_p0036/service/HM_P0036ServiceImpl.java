package com.myspring.eium.hm.hm_p0036.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.hm.hm_p0036.dao.HM_P0036DAO;
import com.myspring.eium.hm.hm_p0036.vo.HM_P0036VO;
import com.myspring.eium.hm.hm_p0040.vo.HM_P0040VO;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0036ServiceImpl implements HM_P0036Service{

	
	@Autowired
	private HM_P0036DAO hM_P0036DAO;
	
	@Override
	public List<HM_P0036VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list =  hM_P0036DAO.searchList(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0036VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list =  hM_P0036DAO.searchList2(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0036VO> searchList3(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list =  hM_P0036DAO.searchList3(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0036VO> searchList_p01(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list =  hM_P0036DAO.searchList_p01(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0036VO> searchList_p02(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list =  hM_P0036DAO.searchList_p02(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0036VO> searchList_p03(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list =  hM_P0036DAO.searchList_p03(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0036VO> searchList_p04(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list =  hM_P0036DAO.searchList_p04(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0036VO> searchList_p05(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list =  hM_P0036DAO.searchList_p05(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0036VO> searchList_p06(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list =  hM_P0036DAO.searchList_p06(searchMap); 
		return list;
	}
	
	

}
