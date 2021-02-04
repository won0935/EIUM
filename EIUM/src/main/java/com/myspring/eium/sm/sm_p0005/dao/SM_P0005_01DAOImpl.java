package com.myspring.eium.sm.sm_p0005.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.sm.sm_p0005.vo.SM_P0005_01VO;


@Repository
public class SM_P0005_01DAOImpl implements SM_P0005_01DAO {
	@Autowired
	private SqlSession sqlSession;

//	@Override
//	public List selectAllp0005_01List() throws DataAccessException {
//		List<p0005_01VO> membersList = null;
//		membersList = sqlSession.selectList("mapper.sm.selectAllp0005_01List");
//		return membersList;
//	}

/*	@Override
	public P0005_01VO loginById(P0005_01VO p0005_01VO) throws DataAccessException {
		P0005_01VO vo = sqlSession.selectOne("mapper.sm.loginById", p0005_01VO);
		return vo;
	} */

	@Override
	public List<SM_P0005_01VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0005_01VO> list = sqlSession.selectList("mapper.sm_p0005.searchList_01", searchMap);
		return list;
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
	
		for(String key : row.keySet()){
        	 
            String value = row.get(key);
 
        }
		sqlSession.update("mapper.sm_p0005.updateData_01", row)
		
		;
	}


}
