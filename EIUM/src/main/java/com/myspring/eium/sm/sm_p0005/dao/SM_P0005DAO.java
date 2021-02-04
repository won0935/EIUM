package com.myspring.eium.sm.sm_p0005.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.sm.sm_p0005.vo.SM_P0005VO;

public interface SM_P0005DAO {
//	public List selectAllp0005List() throws DataAccessException;
//	public int deleteMember(String id) throws DataAccessException;
//	public p0005VO loginById(p0005VO p0005VO) throws DataAccessException;

	public List<SM_P0005VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;

}
