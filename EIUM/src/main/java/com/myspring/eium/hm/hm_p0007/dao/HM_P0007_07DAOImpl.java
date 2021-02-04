package com.myspring.eium.hm.hm_p0007.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0007.vo.HM_P0007_07VO;





@Repository
public class HM_P0007_07DAOImpl implements HM_P0007_07DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HM_P0007_07VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("searchMAp: "+searchMap);
		List<HM_P0007_07VO> list = sqlSession.selectList("mapper.hm_p0007.searchWorking_status", searchMap);
		return list;
	}

}
