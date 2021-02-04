package com.myspring.eium.sm.sm_p0006.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.sm.sm_p0006.vo.SM_P0006_01VO;


public interface SM_P0006_01DAO {
//	public List selectAllp0006_01List() throws DataAccessException;

//	public P0006_01VO loginById(P0006_01VO p0006_01VO) throws DataAccessException;

	public List<SM_P0006_01VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	public void updateData(Map<String, String> row) throws DataAccessException;

}
