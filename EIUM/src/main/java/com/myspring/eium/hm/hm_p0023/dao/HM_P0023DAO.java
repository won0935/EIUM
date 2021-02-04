package com.myspring.eium.hm.hm_p0023.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0023.vo.HM_P0023VO;

public interface HM_P0023DAO {

	List<HM_P0023VO> appointList(Map<String, Object> searchMap) throws DataAccessException;

}
