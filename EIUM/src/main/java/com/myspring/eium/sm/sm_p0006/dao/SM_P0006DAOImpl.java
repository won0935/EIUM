package com.myspring.eium.sm.sm_p0006.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.sm.sm_p0006.vo.SM_P0006VO;

@Repository
public class SM_P0006DAOImpl implements SM_P0006DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SM_P0006VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0006VO> list = sqlSession.selectList("mapper.sm_p0006.searchList", searchMap);
		return list;
	}

	@Override
	public List<SM_P0006VO> searchSiteList(Map<String, Object> searchMap) {
		List<SM_P0006VO> list = sqlSession.selectList("mapper.sm_p0006.searchSiteList", searchMap);
		return list;
	}

	@Override
	public List<SM_P0006VO> searchDeptList(Map<String, Object> searchMap) {
		List<SM_P0006VO> list = sqlSession.selectList("mapper.sm_p0006.searchDeptList", searchMap);
		return list;
	}

}
