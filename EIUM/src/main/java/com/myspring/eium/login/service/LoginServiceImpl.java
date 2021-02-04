package com.myspring.eium.login.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.login.dao.LoginDAO;
import com.myspring.eium.login.vo.LoginVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDAO loginDAO;

	@Override
	public List<LoginVO> searchList(Map<String, Object> searchMap) {
		List<LoginVO> list =  loginDAO.searchList(searchMap); 
		return list;
	}

}
