package com.myspring.eium.wm.wm_p0005.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.wm.wm_p0005.dao.WM_P0005DAO;
import com.myspring.eium.wm.wm_p0005.vo.WM_P0005VO;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class WM_P0005ServiceImpl implements WM_P0005Service {
	@Autowired
	private WM_P0005DAO WM_P0005DAO;
	
	@Override
	public List<WM_P0005VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<WM_P0005VO> list =  WM_P0005DAO.searchList(searchMap); 
		return list;
	}

}
