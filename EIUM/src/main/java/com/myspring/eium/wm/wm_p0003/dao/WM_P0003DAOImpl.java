package com.myspring.eium.wm.wm_p0003.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.wm.wm_p0003.vo.WM_P0003VO;

@Repository
public class WM_P0003DAOImpl implements WM_P0003DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<WM_P0003VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<WM_P0003VO> list = sqlSession.selectList("mapper.wm_p0003.searchList", searchMap);
		return list;
	}
	
}
