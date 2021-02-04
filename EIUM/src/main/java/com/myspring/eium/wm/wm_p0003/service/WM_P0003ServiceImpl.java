package com.myspring.eium.wm.wm_p0003.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.wm.wm_p0003.dao.WM_P0003DAO;
import com.myspring.eium.wm.wm_p0003.vo.WM_P0003VO;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class WM_P0003ServiceImpl implements WM_P0003Service {
	@Autowired
	private WM_P0003DAO WM_P0003DAO;
	
	@Override
	public List<WM_P0003VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<WM_P0003VO> list =  WM_P0003DAO.searchList(searchMap); 
		return list;
	}

}
