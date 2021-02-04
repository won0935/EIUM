package com.myspring.eium.sm.sm_p0005.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.sm.sm_p0005.vo.SM_P0005_01VO;


public interface SM_P0005_01DAO {
//	public List selectAllp0005_01List() throws DataAccessException;

//	public P0005_01VO loginById(P0005_01VO p0005_01VO) throws DataAccessException;

	public List<SM_P0005_01VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

}
