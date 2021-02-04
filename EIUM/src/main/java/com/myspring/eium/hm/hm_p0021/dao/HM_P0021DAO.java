package com.myspring.eium.hm.hm_p0021.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;


import com.myspring.eium.hm.hm_p0021.vo.HM_P0021VO;

public interface HM_P0021DAO {

	List<HM_P0021VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0021VO> eduScoreSearch(Map<String, Object> searchMap)throws DataAccessException;


	void updateData(Map<String, String> row)throws DataAccessException;

	void deleteData(Map<String, String> row)throws DataAccessException;

}
