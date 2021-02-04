package com.myspring.eium.hm.hm_p0036.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0036.vo.HM_P0036VO;

public interface HM_P0036DAO {

	List<HM_P0036VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0036VO> searchList_p01(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0036VO> searchList_p02(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0036VO> searchList_p03(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0036VO> searchList_p04(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0036VO> searchList_p06(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0036VO> searchList_p05(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0036VO> searchList2(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0036VO> searchList3(Map<String, Object> searchMap) throws DataAccessException;

}
