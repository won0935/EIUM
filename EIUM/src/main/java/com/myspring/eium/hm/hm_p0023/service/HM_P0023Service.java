package com.myspring.eium.hm.hm_p0023.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0023.vo.HM_P0023VO;

public interface HM_P0023Service {

	List<HM_P0023VO> appointList(Map<String, Object> searchMap) throws DataAccessException;


}
