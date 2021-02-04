package com.myspring.eium.hm.hm_p0035.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0035.vo.HM_P0035VO;

public interface HM_P0035Service {
	 public List<HM_P0035VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public List<HM_P0035VO> searchSiteList(Map<String, Object> searchMap);
	 public List<HM_P0035VO> searchDeptList(Map<String, Object> searchMap);
}
