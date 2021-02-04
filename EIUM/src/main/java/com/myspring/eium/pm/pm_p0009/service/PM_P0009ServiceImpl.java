package com.myspring.eium.pm.pm_p0009.service;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import com.myspring.eium.pm.pm_p0009.dao.PM_P0009DAO;
import com.myspring.eium.pm.pm_p0009.vo.PM_P0009VO;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class PM_P0009ServiceImpl implements PM_P0009Service {
	@Autowired
	private PM_P0009DAO p0009DAO;

	@Override
	public List<PM_P0009VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0009VO> list =  p0009DAO.searchList(searchMap); 
		return list;
	}

	
}
