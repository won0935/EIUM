package com.myspring.eium.hm.hm_p0036.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0036.vo.HM_P0036VO;


@Repository
public class HM_P0036DAOImpl implements HM_P0036DAO{
	

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HM_P0036VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list = sqlSession.selectList("mapper.hm_p0036.searchList", searchMap);

		return list;
	}
	@Override
	public List<HM_P0036VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list = sqlSession.selectList("mapper.hm_p0036.searchList2", searchMap);

		return list;
	}
	@Override
	public List<HM_P0036VO> searchList3(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list = sqlSession.selectList("mapper.hm_p0036.searchList3", searchMap);

		return list;
	}
	
	@Override
	public List<HM_P0036VO> searchList_p01(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list = sqlSession.selectList("mapper.hm_p0036.searchList_p01", searchMap);

		return list;
	}
	@Override
	public List<HM_P0036VO> searchList_p02(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list = sqlSession.selectList("mapper.hm_p0036.searchList_p02", searchMap);

		return list;
	}
	@Override
	public List<HM_P0036VO> searchList_p03(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list = sqlSession.selectList("mapper.hm_p0036.searchList_p03", searchMap);

		return list;
	}
	@Override
	public List<HM_P0036VO> searchList_p04(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list = sqlSession.selectList("mapper.hm_p0036.searchList_p04", searchMap);

		return list;
	}
	@Override
	public List<HM_P0036VO> searchList_p05(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list = sqlSession.selectList("mapper.hm_p0036.searchList_p05", searchMap);

		return list;
	}
	@Override
	public List<HM_P0036VO> searchList_p06(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0036VO> list = sqlSession.selectList("mapper.hm_p0036.searchList_p06", searchMap);

		return list;
	}
	
	
}
