package com.myspring.eium.pm.pm_p0002.dao;




import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.pm.pm_p0002.vo.PM_P0002VO;




@Repository
public class PM_P0002DAOImpl implements PM_P0002DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PM_P0002VO> typeList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0002VO> list = sqlSession.selectList("mapper.pm_p0002.typeList", searchMap);
		return list;
	}
	
	
	
	@Override
	public List<PM_P0002VO> paygradeList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0002VO> list = sqlSession.selectList("mapper.pm_p0002.paygradeList", searchMap);
		return list;
	}
	
	@Override
	public List<PM_P0002VO> paydate_searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0002VO> list = sqlSession.selectList("mapper.pm_p0002.paydate_searchList", searchMap);
		return list;
	}
	
	
	@Override
	public List<PM_P0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0002VO> list = sqlSession.selectList("mapper.pm_p0002.searchList", searchMap);
		return list;
	}
	
	@Override
	public List<PM_P0002VO> searchReceipt(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0002VO> list = sqlSession.selectList("mapper.pm_p0002.searchReceipt", searchMap);
		return list;
	}
	


	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0002.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0002.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0002.deleteData", row);
	}

	

}
