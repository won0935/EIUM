package com.myspring.eium.hm.hm_p0033.dao;




import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0033.vo.HM_P0033VO;




@Repository
public class HM_P0033DAOImpl implements HM_P0033DAO {
	@Autowired
	private SqlSession sqlSession;

	
	
	@Override
	public List<HM_P0033VO> hr_assessment_List(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list = sqlSession.selectList("mapper.hm_p0033.hr_assessment_List", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0033VO> hr_rnp_List(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list = sqlSession.selectList("mapper.hm_p0033.hr_rnp_List", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0033VO> site_List(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list = sqlSession.selectList("mapper.hm_p0033.site_List", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0033VO> employee_List(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list = sqlSession.selectList("mapper.hm_p0033.employee_List", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0033VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list = sqlSession.selectList("mapper.hm_p0033.searchList", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0033VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list = sqlSession.selectList("mapper.hm_p0033.searchList2", searchMap);
		return list;
	}
	
	

	

}
