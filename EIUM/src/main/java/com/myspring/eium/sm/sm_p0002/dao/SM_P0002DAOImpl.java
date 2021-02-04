package com.myspring.eium.sm.sm_p0002.dao;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.sm.sm_p0002.vo.SM_P0002VO;


@Repository
public class SM_P0002DAOImpl implements SM_P0002DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SM_P0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("searchMAp: "+searchMap);
		List<SM_P0002VO> list = sqlSession.selectList("mapper.sm_p0002.searchList", searchMap);
		return list;
	}
	@Override
	public List<SM_P0002VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0002VO> list = sqlSession.selectList("mapper.sm_p0002.searchList2", searchMap);
		return list;
	}

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.sm_p0002.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.sm_p0002.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.sm_p0002.deleteData", row);
	}

}
