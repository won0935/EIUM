package com.myspring.eium.wm.wm_p0003.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.wm.wm_p0003.vo.WM_P0003VO;

public interface WM_P0003Service {
	 public List<WM_P0003VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
}
