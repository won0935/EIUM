package com.myspring.eium.hm.hm_p0040.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0018.vo.HM_P0018VO;
import com.myspring.eium.hm.hm_p0040.vo.HM_P0040VO;



public interface HM_P0040DAO {

	public List<HM_P0040VO> searchList(Map<String, Object> searchMap)throws DataAccessException;

	List<HM_P0040VO> searchEmployee(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0040VO> searchTraining(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0040VO> searchEmployeeList(Map<String, Object> searchMap) throws DataAccessException;

}
