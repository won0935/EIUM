package com.myspring.eium.pm.pm_p0004.dao;




import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.pm.pm_p0004.vo.PM_P0004VO;




@Repository
public class PM_P0004DAOImpl implements PM_P0004DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PM_P0004VO> typeList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0004VO> list = sqlSession.selectList("mapper.pm_p0004.typeList", searchMap);
		return list;
	}
	
	
	
	@Override
	public List<PM_P0004VO> paygradeList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0004VO> list = sqlSession.selectList("mapper.pm_p0004.paygradeList", searchMap);
		return list;
	}
	
	@Override
	public List<PM_P0004VO> paydate_searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0004VO> list = sqlSession.selectList("mapper.pm_p0004.paydate_searchList", searchMap);
		return list;
	}
	
	
	@Override
	public List<PM_P0004VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0004VO> list = sqlSession.selectList("mapper.pm_p0004.searchList", searchMap);
		return list;
	}
	
	@Override
	public List<PM_P0004VO> searchReceipt(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0004VO> list = sqlSession.selectList("mapper.pm_p0004.searchReceipt", searchMap);
		return list;
	}
	
	@Override
	public List<PM_P0004VO> BankList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0004VO> list = sqlSession.selectList("mapper.pm_p0004.BankList", searchMap);
		return list;
	}
	


	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0004.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0004.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0004.deleteData", row);
	}

	

}
