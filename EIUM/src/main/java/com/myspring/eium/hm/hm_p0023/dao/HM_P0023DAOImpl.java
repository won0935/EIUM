package com.myspring.eium.hm.hm_p0023.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0023.vo.HM_P0023VO;

@Repository
public class HM_P0023DAOImpl implements HM_P0023DAO{
	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<HM_P0023VO> appointList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0023VO> list = sqlSession.selectList("mapper.hm_p0023.appointList", searchMap);
	
		return list;
	}
	

	
}
