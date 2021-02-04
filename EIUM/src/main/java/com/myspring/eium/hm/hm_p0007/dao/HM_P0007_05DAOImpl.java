package com.myspring.eium.hm.hm_p0007.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0007.vo.HM_P0007_05VO;





@Repository
public class HM_P0007_05DAOImpl implements HM_P0007_05DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HM_P0007_05VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("searchMAp: "+searchMap);
		List<HM_P0007_05VO> list = sqlSession.selectList("mapper.hm_p0007.searchAppoint", searchMap);
		return list;
	}

}
