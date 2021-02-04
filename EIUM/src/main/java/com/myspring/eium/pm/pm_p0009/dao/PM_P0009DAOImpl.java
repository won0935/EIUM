package com.myspring.eium.pm.pm_p0009.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.pm.pm_p0009.vo.PM_P0009VO;



@Repository
public class PM_P0009DAOImpl implements PM_P0009DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PM_P0009VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0009VO> list = sqlSession.selectList("mapper.pm_p0009.searchList", searchMap);
		return list;
	}
	

}
