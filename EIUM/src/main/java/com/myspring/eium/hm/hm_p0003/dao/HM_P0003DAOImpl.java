package com.myspring.eium.hm.hm_p0003.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0003.vo.HM_P0003VO;


@Repository
public class HM_P0003DAOImpl implements HM_P0003DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HM_P0003VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		
		List<HM_P0003VO> list = sqlSession.selectList("mapper.hm_p0003.searchList", searchMap);
		return list;
	}
	@Override
	public List<HM_P0003VO> searchList2(Map<String, String> searchMap) throws DataAccessException {
		List<HM_P0003VO> list = sqlSession.selectList("mapper.hm_p0003.searchList2", searchMap);
		return list;
	}

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0003.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0003.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0003.deleteData", row);
	}

}
