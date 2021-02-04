package com.myspring.eium.sm.sm_p0006.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.sm.sm_p0006.vo.SM_P0006_01VO;


@Repository
public class SM_P0006_01DAOImpl implements SM_P0006_01DAO {
	@Autowired
	private SqlSession sqlSession;


	@Override
	public List<SM_P0006_01VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0006_01VO> list = sqlSession.selectList("mapper.sm_p0006.searchList_01", searchMap);
		return list;
	}
	


	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
	
		for(String key : row.keySet()){
        	 
            String value = row.get(key);
 
        }
		sqlSession.update("mapper.sm_p0006.insertData_01", row);
		//sqlSession.update("mapper.sm_p0006.updateData_01", row);
	}


}
