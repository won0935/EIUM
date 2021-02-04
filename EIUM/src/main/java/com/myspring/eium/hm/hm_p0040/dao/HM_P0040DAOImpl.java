package com.myspring.eium.hm.hm_p0040.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0040.vo.HM_P0040VO;


@Repository
public class HM_P0040DAOImpl implements HM_P0040DAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HM_P0040VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0040VO> list = sqlSession.selectList("mapper.hm_p0040.searchList", searchMap);

		return list;
	}
	

	@Override
	public List<HM_P0040VO> searchEmployee(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0040VO> list = sqlSession.selectList("mapper.hm_p0040.searchEmployee", searchMap);

		return list;
	}

	@Override
	public List<HM_P0040VO> searchTraining(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0040VO> list = sqlSession.selectList("mapper.hm_p0040.searchTraining", searchMap);

		return list;
	}

	@Override
	public List<HM_P0040VO> searchEmployeeList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0040VO> list = sqlSession.selectList("mapper.hm_p0040.searchEmployeeList", searchMap);

		return list;
	}
	
	
	
}
