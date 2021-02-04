package com.myspring.eium.pm.pm_p0003.dao;




import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.pm.pm_p0003.vo.PM_P0003VO;




@Repository
public class PM_P0003DAOImpl implements PM_P0003DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PM_P0003VO> typeList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0003VO> list = sqlSession.selectList("mapper.pm_p0003.typeList", searchMap);
		return list;
	}
	
	
	
	@Override
	public List<PM_P0003VO> paygradeList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0003VO> list = sqlSession.selectList("mapper.pm_p0003.paygradeList", searchMap);
		return list;
	}
	
	@Override
	public List<PM_P0003VO> paydate_searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0003VO> list = sqlSession.selectList("mapper.pm_p0003.paydate_searchList", searchMap);
		return list;
	}
	
	
	@Override
	public List<PM_P0003VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0003VO> list = sqlSession.selectList("mapper.pm_p0003.searchList", searchMap);
		return list;
	}
	
	@Override
	public List<PM_P0003VO> searchReceipt(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0003VO> list = sqlSession.selectList("mapper.pm_p0003.searchReceipt", searchMap);
		return list;
	}
	


	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0003.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0003.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0003.deleteData", row);
	}

	

}
