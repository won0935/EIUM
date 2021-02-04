package com.myspring.eium.sm.sm_p0004.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.sm.sm_p0004.vo.SM_P0004VO;

public interface SM_P0004DAO {
//	public List selectAllp0005List() throws DataAccessException;
//	public int deleteMember(String id) throws DataAccessException;
//	public p0005VO loginById(p0005VO p0005VO) throws DataAccessException;

	public List<SM_P0004VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;

	public List<SM_P0004VO> companyList(Map<String, Object> searchMap)throws DataAccessException;



}
