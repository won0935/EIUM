package com.myspring.eium.login.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.login.vo.LoginVO;


public interface LoginDAO {

	List<LoginVO> searchList(Map<String, Object> searchMap);


}
