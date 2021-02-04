package com.myspring.eium.hm.hm_p0007.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0007.vo.HM_P0007VO;





@Repository
public class HM_P0007DAOImpl implements HM_P0007DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HM_P0007VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("searchMAp: "+searchMap);
		List<HM_P0007VO> list = sqlSession.selectList("mapper.hm_p0007.searchList", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0007VO> languageList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("searchMAp: "+searchMap);
		List<HM_P0007VO> list = sqlSession.selectList("mapper.hm_p0007.languageList", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0007VO> licenseList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("searchMAp: "+searchMap);
		List<HM_P0007VO> list = sqlSession.selectList("mapper.hm_p0007.licenseList", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0007VO> assessmentList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("searchMAp: "+searchMap);
		List<HM_P0007VO> list = sqlSession.selectList("mapper.hm_p0007.assessmentList", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0007VO> rnpList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("searchMAp: "+searchMap);
		List<HM_P0007VO> list = sqlSession.selectList("mapper.hm_p0007.rnpList", searchMap);
		return list;
	}

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0007.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0007.updateHr_info", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0007.deleteData", row);
	}
	



}
