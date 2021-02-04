package com.myspring.eium.hm.hm_p0022.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0021.vo.HM_P0021VO;
import com.myspring.eium.hm.hm_p0022.vo.HM_P0022VO;

@Repository
public class HM_P0022DAOImpl implements HM_P0022DAO{
	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<HM_P0022VO> appointList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0022VO> list = sqlSession.selectList("mapper.hm_p0022.appointList", searchMap);
	
		return list;
	}
	
	@Override
	public List<HM_P0022VO> appointList2(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0022VO> list = sqlSession.selectList("mapper.hm_p0022.appointList2", searchMap);
	
		return list;
	}
	
	@Override
	public List<HM_P0022VO> appointList3(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0022VO> list = sqlSession.selectList("mapper.hm_p0022.appointList3", searchMap);
	
		return list;
	}
	

	@Override
	public List<HM_P0022VO> masterEmployee_p02(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0022VO> list = sqlSession.selectList("mapper.hm_p0022.masterEmployee_p02", searchMap);
	
		return list;
	}
	@Override
	public List<HM_P0022VO> homeSearch_p02(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0022VO> list = sqlSession.selectList("mapper.hm_p0022.homeSearch_p02", searchMap);
	
		return list;
	}
	@Override
	public List<HM_P0022VO> homeSearch_p03(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0022VO> list = sqlSession.selectList("mapper.hm_p0022.homeSearch_p03", searchMap);
	
		return list;
	}
	@Override
	public List<HM_P0022VO> homeSearch_p04(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0022VO> list = sqlSession.selectList("mapper.hm_p0022.homeSearch_p04", searchMap);
	
		return list;
	}
	@Override
	public List<HM_P0022VO> homeSearch_p05(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0022VO> list = sqlSession.selectList("mapper.hm_p0022.homeSearch_p05", searchMap);
	
		return list;
	}
	@Override
	public List<HM_P0022VO> homeEmployeeSearch(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0022VO> list = sqlSession.selectList("mapper.hm_p0022.homeEmployeeSearch", searchMap);
	
		return list;
	}

	@Override
	public void insertData1(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0022.insertData1", row);
		
	}

	@Override
	public void updateData1(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0022.updateData1", row);
		
	}

	@Override
	public void deleteData1(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0022.deleteData1", row);
		
	}
	
	@Override
	public void insertData2(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0022.insertData2", row);
		
	}

	@Override
	public void updateData2(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0022.updateData2", row);
		
	}

	@Override
	public void deleteData2(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0022.deleteData2", row);
		
	}


	@Override
	public void updateData3(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0022.updateData3", row);
		
	}
	@Override
	public void updateData4(Map<String, String> row) throws DataAccessException {
	       for(String key : row.keySet()){
	    	   
	            String value = row.get(key);
	 
	            System.out.println("잉잉dao"+key+" : "+value);
	 
	        }
		sqlSession.update("mapper.hm_p0022.updateData4", row);
		

	}





	
	
}
