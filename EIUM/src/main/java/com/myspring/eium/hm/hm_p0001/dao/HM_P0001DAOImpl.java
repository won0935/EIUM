package com.myspring.eium.hm.hm_p0001.dao;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0001.vo.HM_P0001VO;





@Repository
public class HM_P0001DAOImpl implements HM_P0001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HM_P0001VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("searchList1 - searchMap: "+searchMap);
		List<HM_P0001VO> list = sqlSession.selectList("mapper.hm_p0001.POSITION_searchList", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0001VO> searchList2(Map<String, String> searchMap) throws DataAccessException {
		System.out.println("searchList2 - searchMap: "+searchMap);
		List<HM_P0001VO> list = sqlSession.selectList("mapper.hm_p0001.PAY_GRADE_searchList", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0001VO> searchList3(Map<String, String> searchMap) throws DataAccessException {
		System.out.println("searchList3 - searchMap: "+searchMap);
		List<HM_P0001VO> list = sqlSession.selectList("mapper.hm_p0001.PAY_GRADE_TABLE_searchList", searchMap);
		return list;
	}
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0001.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0001.updateData", row);
	}

	@Override
	public void DATE_updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0001.DATE_updateData", row);
	}
	@Override
	public void SALARY_updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0001.SALARY_updateData", row);
	}
	@Override
	public void DATE_deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0001.DATE_deleteData", row);
	}

	@Override
	public void BACKDATE_updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0001.BACKDATE_updateData", row);
		/*
		 * for ( String key : row.keySet() ) { System.out.println("방법1) key : " + key
		 * +" / value : " + row.get(key)); }
		 * System.out.println("=======================");
		 */
		
	}

	

	

}
