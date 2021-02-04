package com.myspring.eium.hm.hm_p0021.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0021.vo.HM_P0021VO;

public interface HM_P0021Service {

	List<HM_P0021VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0021VO> eduScoreSearch(Map<String, Object> searchMap)throws DataAccessException;

	void saveData(Map<String, String[]> dataMap, String u) throws DataAccessException;

}
