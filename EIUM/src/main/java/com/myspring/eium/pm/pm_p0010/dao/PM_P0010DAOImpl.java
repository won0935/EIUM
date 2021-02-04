package com.myspring.eium.pm.pm_p0010.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.pm.pm_p0010.vo.PM_P0010VO;



@Repository
public class PM_P0010DAOImpl implements PM_P0010DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PM_P0010VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0010VO> list = sqlSession.selectList("mapper.pm_p0010.searchList", searchMap);
		return list;
	}
	@Override
	public List<PM_P0010VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0010VO> list = sqlSession.selectList("mapper.pm_p0010.searchList2", searchMap);
		return list;
	}
	@Override
	public List<PM_P0010VO> searchList3(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0010VO> list = sqlSession.selectList("mapper.pm_p0010.searchList3", searchMap);
		return list;
	}
	

}
