package com.myspring.eium.hm.hm_p0018.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0018.vo.HM_P0018VO;


@Repository
public class HM_P0018DAOImpl implements HM_P0018DAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HM_P0018VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0018VO> list = sqlSession.selectList("mapper.hm_p0018.searchList", searchMap);
		System.out.println("dao searcmap 에듀코드############"+searchMap.get("eduCode"));
		return list;
	}
	
	@Override
	public List<HM_P0018VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0018VO> list = sqlSession.selectList("mapper.hm_p0018.searchList2", searchMap);
		System.out.println("dao searcmap 에듀코드############"+searchMap.get("eduCode"));
		return list;
	}
	
	@Override
	public List<HM_P0018VO> emplyoeeListSearch(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0018VO> list = sqlSession.selectList("mapper.hm_p0018.emplyoeeListSearch", searchMap);

		return list;
	}
	
	@Override
	public List<HM_P0018VO> employeeSearch(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0018VO> list = sqlSession.selectList("mapper.hm_p0018.employeeSearch", searchMap);

		return list;
	}
		
	@Override
	public List<HM_P0018VO> autocomplete(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0018VO> list = sqlSession.selectList("mapper.hm_p0018.autocomplete", searchMap);

		return list;
	}
		
	@Override
	public void insertData(Map<String, String> row) {
		sqlSession.update("mapper.hm_p0018.insertData", row);
	       for(String key : row.keySet()){
	    	   
	            String value = row.get(key);
	 
	            System.out.println(key+" : "+value);
	 
	        }
		
		
	}

	@Override
	public void updateData(Map<String, String> row) {
		sqlSession.update("mapper.hm_p0018.updateData", row);
		
	}

	@Override
	public void deleteData(Map<String, String> row) {
		sqlSession.update("mapper.hm_p0018.deleteData", row);
		
	}
		
	
	@Override
	public void emplyoeeListinsertData(Map<String, String> row) {
		sqlSession.update("mapper.hm_p0018.emplyoeeListinsertData", row);
	       for(String key : row.keySet()){
	    	   
	            String value = row.get(key);
	 
	            System.out.println("%%%%%%%%%@#$@#$@#%@%@"+key+" : "+value);
	 
	        }
		
		
	}

	@Override
	public void emplyoeeListupdateData(Map<String, String> row) {
		sqlSession.update("mapper.hm_p0018.emplyoeeListupdateData", row);
		
	}

	@Override
	public void emplyoeeListdeleteData(Map<String, String> row) {
		sqlSession.update("mapper.hm_p0018.emplyoeeListdeleteData", row);
		
	}


	
}
