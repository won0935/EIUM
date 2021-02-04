package com.myspring.eium.sm.sm_p0001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.sm.sm_p0001.vo.SM_P0001VO;


@Repository
public class SM_P0001DAOImpl implements SM_P0001DAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SM_P0001VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0001VO> list = sqlSession.selectList("mapper.sm_p0001.searchList", searchMap);
		System.out.println("P0001DAOImpl++++++dao"+searchMap);
		return list;
	}

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.sm_p0001.insertData", row);
		
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.sm_p0001.updateData", row);
		
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.sm_p0001.deleteData", row);
		
	}

}
