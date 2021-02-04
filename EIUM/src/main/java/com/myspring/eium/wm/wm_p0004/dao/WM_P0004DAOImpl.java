package com.myspring.eium.wm.wm_p0004.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.wm.wm_p0004.vo.WM_P0004VO;

@Repository
public class WM_P0004DAOImpl implements WM_P0004DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<WM_P0004VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<WM_P0004VO> list = sqlSession.selectList("mapper.wm_p0004.searchList", searchMap);
		return list;
	}
	
	@Override
	public List<WM_P0004VO> searchEmployeeList(Map<String, Object> searchMap) throws DataAccessException {
		List<WM_P0004VO> list = sqlSession.selectList("mapper.wm_p0004.searchEmployeeList", searchMap);
		return list;
	}
	
	@Override
	public List<WM_P0004VO> searchCountryList(Map<String, Object> searchMap) throws DataAccessException {
		List<WM_P0004VO> list = sqlSession.selectList("mapper.wm_p0004.searchCountryList", searchMap);
		return list;
	}
	
	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
	
		for(String key : row.keySet()){
        	 
            String value = row.get(key);
 
        }
		sqlSession.update("mapper.wm_p0004.insertData", row);
	}
	
	@Override
	public void updateData2(Map<String, String> row) throws DataAccessException {
	
		for(String key : row.keySet()){
        	 
            String value = row.get(key);
 
        }
		sqlSession.update("mapper.wm_p0004.updateData", row);
	}
	
	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.wm_p0004.deleteData", row);
	}

}
