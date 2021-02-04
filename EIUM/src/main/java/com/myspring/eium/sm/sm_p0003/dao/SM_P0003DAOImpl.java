package com.myspring.eium.sm.sm_p0003.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.sm.sm_p0003.vo.SM_P0003VO;

@Repository
public class SM_P0003DAOImpl implements SM_P0003DAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SM_P0003VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0003VO> list = sqlSession.selectList("sm_p0003.searchDep", searchMap);
		return list;
	}
	


	@Override
	public void insertData(Map<String, String> row) {
		sqlSession.update("sm_p0003.insertData", row);
		
	}

	@Override
	public void updateData(Map<String, String> row) {
		sqlSession.update("sm_p0003.updateData", row);
		
	}

	@Override
	public void deleteData(Map<String, String> row) {
		sqlSession.update("sm_p0003.deleteData", row);
		
	}
	
	
	
	
	
	
	@Override
	public List<SM_P0003VO> searchpopup(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0003VO> list = sqlSession.selectList("sm_p0003.searchPopup", searchMap);
		return list;
	}
	
	@Override
	public void insertDatapopup(Map<String, String> row) {
		sqlSession.update("sm_p0003.insertDataPopup", row);
		
	}

	@Override
	public void updateDatapopup(Map<String, String> row) {
		sqlSession.update("sm_p0003.updateDataPopup", row);
		
	}

	@Override
	public void deleteDatapopup(Map<String, String> row) {
		sqlSession.update("sm_p0003.deleteDataPopup", row);
		
	}



	@Override
	public List<SM_P0003VO> searchSiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0003VO> list = sqlSession.selectList("sm_p0003.searchSiteList", searchMap);
		return list;
	}


	
	
	
}
