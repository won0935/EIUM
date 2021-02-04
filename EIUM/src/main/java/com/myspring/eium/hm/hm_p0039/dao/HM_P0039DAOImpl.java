package com.myspring.eium.hm.hm_p0039.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0039.vo.HM_P0039VO;
import com.myspring.eium.hm.hm_p0040.vo.HM_P0040VO;

@Repository
public class HM_P0039DAOImpl implements HM_P0039DAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HM_P0039VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0039VO> list = sqlSession.selectList("mapper.hm_p0039.searchList", searchMap);

		return list;
	}
	
}
