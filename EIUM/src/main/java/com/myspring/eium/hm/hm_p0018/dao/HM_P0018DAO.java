package com.myspring.eium.hm.hm_p0018.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0018.vo.HM_P0018VO;



public interface HM_P0018DAO {

	public List<HM_P0018VO> searchList(Map<String, Object> searchMap)throws DataAccessException;


	public void insertData(Map<String, String> row)throws DataAccessException;

	public void updateData(Map<String, String> row)throws DataAccessException;

	public void deleteData(Map<String, String> row)throws DataAccessException;


	List<HM_P0018VO> emplyoeeListSearch(Map<String, Object> searchMap) throws DataAccessException;


	void emplyoeeListinsertData(Map<String, String> row)throws DataAccessException;


	void emplyoeeListupdateData(Map<String, String> row)throws DataAccessException;


	void emplyoeeListdeleteData(Map<String, String> row)throws DataAccessException;


	public List<HM_P0018VO> employeeSearch(Map<String, Object> searchMap)throws DataAccessException;


	List<HM_P0018VO> autocomplete(Map<String, Object> searchMap) throws DataAccessException;


	List<HM_P0018VO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
}
