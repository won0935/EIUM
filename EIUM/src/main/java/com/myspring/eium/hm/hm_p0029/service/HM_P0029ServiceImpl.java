package com.myspring.eium.hm.hm_p0029.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.myspring.eium.hm.hm_p0029.dao.HM_P0029DAO;
import com.myspring.eium.hm.hm_p0029.vo.HM_P0029VO;

import oracle.net.aso.p;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0029ServiceImpl implements HM_P0029Service {
	@Autowired
	private HM_P0029DAO p0029DAO;

	@Override
	public List<HM_P0029VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0029VO> list =  p0029DAO.searchList2(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0029VO> searchList_site(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0029VO> list = p0029DAO.searchList_site(searchMap);
		return list;
	}
	@Override
	public List<HM_P0029VO> searchList_TN(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0029VO> list =  p0029DAO.searchList_TN(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0029VO> searchList_BN(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0029VO> list =  p0029DAO.searchList_BN(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0029VO> searchList_LI(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0029VO> list =  p0029DAO.searchList_LI(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0029VO> searchList_LA(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0029VO> list =  p0029DAO.searchList_LA(searchMap); 
		return list;
	}
}
