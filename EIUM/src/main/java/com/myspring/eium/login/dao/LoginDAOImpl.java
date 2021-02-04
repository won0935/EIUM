package com.myspring.eium.login.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0022.vo.HM_P0022VO;
import com.myspring.eium.login.vo.LoginVO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<LoginVO> searchList(Map<String, Object> searchMap) {
		List<LoginVO> list = sqlSession.selectList("mapper.login.searchList", searchMap);
		
		return list;
	}
}
