package com.myspring.eium.wm.wm_p0001.dao;




import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.wm.wm_p0001.vo.WM_P0001VO;




@Repository
public class WM_P0001DAOImpl implements WM_P0001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<WM_P0001VO> EMP_searchList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("EMP_searchList - searchMAp: "+searchMap);
		List<WM_P0001VO> list = sqlSession.selectList("mapper.wm_p0001.EMP_searchList", searchMap);
		return list;
	}
	
	@Override
	public List<WM_P0001VO> WS_searchList(Map<String, String> searchMap) throws DataAccessException {
		System.out.println("WS_searchList - searchMAp: "+searchMap);
		List<WM_P0001VO> list = sqlSession.selectList("mapper.wm_p0001.WS_searchList", searchMap);
		return list;
	}

	@Override
	public List<WM_P0001VO> TWS_searchList(Map<String, String> searchMap) throws DataAccessException {
		System.out.println("TWS_searchList - searchMAp: "+searchMap);
		List<WM_P0001VO> list = sqlSession.selectList("mapper.wm_p0001.TWS_searchList", searchMap);
		return list;
	}
	
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.wm_p0001.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.wm_p0001.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.wm_p0001.deleteData", row);
	}

	@Override
	public void TWS_insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.wm_p0001.TWS_insertData", row);
	}

	
	@Override
	public void WS_YN_updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.wm_p0001.WS_YN_updateData", row);
		/*
		 * for ( String key : row.keySet() ) { System.out.println("방법1) key : " + key
		 * +" / value : " + row.get(key)); }
		 * System.out.println("=======================");
		 */
	}

	@Override
	public void WS_YN_rollbackData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.wm_p0001.WS_YN_rollbackData", row);
		
		for ( String key : row.keySet() ) { System.out.println("방법1) key : " + key
				  +" / value : " + row.get(key)); }
				  System.out.println("=======================");
	}

	
	
	/*
	 * @Override public void WS_YN_updateData(String yN_EMP_CODE, String
	 * yN_WS_MONTH) throws DataAccessException { System.out.println(yN_EMP_CODE
	 * +" ///////" + yN_WS_MONTH);
	 * sqlSession.update("mapper.wm_p0001.TWS_YN_updateData", yN_EMP_CODE,
	 * yN_WS_MONTH);
	 * 
	 * 
	 * }
	 */

	

}
