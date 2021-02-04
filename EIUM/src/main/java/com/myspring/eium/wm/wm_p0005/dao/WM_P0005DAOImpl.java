package com.myspring.eium.wm.wm_p0005.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.wm.wm_p0005.vo.WM_P0005VO;

@Repository
public class WM_P0005DAOImpl implements WM_P0005DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<WM_P0005VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<WM_P0005VO> list = sqlSession.selectList("mapper.wm_p0005.searchList", searchMap);
		return list;
	}

}
