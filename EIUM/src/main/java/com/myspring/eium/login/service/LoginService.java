package com.myspring.eium.login.service;

import java.util.List;
import java.util.Map;

import com.myspring.eium.login.vo.LoginVO;

public interface LoginService {

	public List<LoginVO> searchList(Map<String, Object> searchMap);
}
