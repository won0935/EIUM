package com.myspring.eium.hm.hm_p0029.dao;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.myspring.eium.hm.hm_p0029.vo.HM_P0029VO;

@Repository
public class HM_P0029DAOImpl implements HM_P0029DAO {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	HM_P0029VO p0029Vo;
	
	@Override
	public List<HM_P0029VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0029VO> list = sqlSession.selectList("mapper.hm_p0029.searchList2", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0029VO> searchList_site(Map<String, Object> searchMap) throws DataAccessException{
		List<HM_P0029VO> list= sqlSession.selectList("mapper.hm_p0029.searchList_site", searchMap);
		
		return list;
	}

	@Override
	public List<HM_P0029VO> searchList_TN(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0029VO> list = sqlSession.selectList("mapper.hm_p0029.searchList_TN", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0029VO> searchList_BN(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0029VO> list = sqlSession.selectList("mapper.hm_p0029.searchList_BN", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0029VO> searchList_LI(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0029VO> list = sqlSession.selectList("mapper.hm_p0029.searchList_LI", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0029VO> searchList_LA(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0029VO> list = sqlSession.selectList("mapper.hm_p0029.searchList_LA", searchMap);
		return list;
	}
}
