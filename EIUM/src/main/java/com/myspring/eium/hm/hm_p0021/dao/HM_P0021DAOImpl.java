package com.myspring.eium.hm.hm_p0021.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0018.vo.HM_P0018VO;
import com.myspring.eium.hm.hm_p0021.vo.HM_P0021VO;

@Repository
public class HM_P0021DAOImpl implements HM_P0021DAO{


	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HM_P0021VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0021VO> list = sqlSession.selectList("mapper.hm_p0018.searchList", searchMap);
		System.out.println("dao searcmap 에듀코드############"+searchMap.get("eduCode"));
		return list;
	}

	@Override
	public List<HM_P0021VO> eduScoreSearch(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0021VO> list = sqlSession.selectList("mapper.hm_p0021.eduScoreSearch", searchMap);
		System.out.println("dao searcmap 에듀코드############"+searchMap.get("eduCode"));
		return list;
	}



	@Override
	public void updateData(Map<String, String> row) {
		sqlSession.update("mapper.hm_p0021.eduScoreUpdate", row);
		
	}

	@Override
	public void deleteData(Map<String, String> row) {
		sqlSession.update("mapper.hm_p0021.deleteData", row);
		
	}


	
	
}
