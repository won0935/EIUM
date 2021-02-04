package com.myspring.eium.hm.hm_p0033.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0033.vo.HM_P0033VO;

public interface HM_P0033Service {
	public List<HM_P0033VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	public List<HM_P0033VO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
	public List<HM_P0033VO> hr_assessment_List(Map<String, Object> searchMap)throws DataAccessException;
	public List<HM_P0033VO> site_List(Map<String, Object> searchMap) throws DataAccessException;
	public List<HM_P0033VO> employee_List(Map<String, Object> searchMap) throws DataAccessException;
	public List<HM_P0033VO> hr_rnp_List(Map<String, Object> searchMap) throws DataAccessException;

}
