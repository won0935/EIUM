package com.myspring.eium.hm.hm_p0007.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0007.vo.HM_P0007_02VO;
import com.myspring.eium.hm.hm_p0007.vo.HM_P0007_03VO;





@Repository
public class HM_P0007_03DAOImpl implements HM_P0007_03DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HM_P0007_03VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("searchMAp: "+searchMap);
		List<HM_P0007_03VO> list = sqlSession.selectList("mapper.hm_p0007.searchCareer", searchMap);
		return list;
	}
	
	
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0007.insertCareer", row);

	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0007.updateCareer", row);


	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0007.deleteCareer", row);
		

	}

}
