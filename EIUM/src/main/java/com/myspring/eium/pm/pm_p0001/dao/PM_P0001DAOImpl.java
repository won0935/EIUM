package com.myspring.eium.pm.pm_p0001.dao;




import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.pm.pm_p0001.vo.PM_P0001VO;




@Repository
public class PM_P0001DAOImpl implements PM_P0001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PM_P0001VO> typeList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0001VO> list = sqlSession.selectList("mapper.pm_p0001.typeList", searchMap);
		return list;
	}
	
	
	
	@Override
	public List<PM_P0001VO> paygradeList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0001VO> list = sqlSession.selectList("mapper.pm_p0001.paygradeList", searchMap);
		return list;
	}
	
	@Override
	public List<PM_P0001VO> paydate_searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0001VO> list = sqlSession.selectList("mapper.pm_p0001.paydate_searchList", searchMap);
		return list;
	}
	
	
	@Override
	public List<PM_P0001VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0001VO> list = sqlSession.selectList("mapper.pm_p0001.searchList", searchMap);
		return list;
	}
	
	@Override
	public List<PM_P0001VO> searchReceipt(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0001VO> list = sqlSession.selectList("mapper.pm_p0001.searchReceipt", searchMap);
		return list;
	}
	


	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0001.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0001.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0001.deleteData", row);
	}

	

}
