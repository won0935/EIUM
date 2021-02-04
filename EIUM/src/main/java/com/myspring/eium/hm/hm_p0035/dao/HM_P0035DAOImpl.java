package com.myspring.eium.hm.hm_p0035.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0035.vo.HM_P0035VO;


@Repository
public class HM_P0035DAOImpl implements HM_P0035DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HM_P0035VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0035VO> list = sqlSession.selectList("mapper.hm_p0035.searchList", searchMap);
		return list;
	}

	@Override
	public List<HM_P0035VO> searchSiteList(Map<String, Object> searchMap) {
		List<HM_P0035VO> list = sqlSession.selectList("mapper.hm_p0035.searchSiteList", searchMap);
		return list;
	}

	@Override
	public List<HM_P0035VO> searchDeptList(Map<String, Object> searchMap) {
		List<HM_P0035VO> list = sqlSession.selectList("mapper.hm_p0035.searchDeptList", searchMap);
		return list;
	}

}
