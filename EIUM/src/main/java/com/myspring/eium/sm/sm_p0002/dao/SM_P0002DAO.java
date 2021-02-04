package com.myspring.eium.sm.sm_p0002.dao;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import com.myspring.eium.sm.sm_p0002.vo.SM_P0002VO;

public interface SM_P0002DAO {
	 public List<SM_P0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;

	List<SM_P0002VO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
	 
}
