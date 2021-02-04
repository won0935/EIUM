package com.myspring.eium.wm.wm_p0005.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.wm.wm_p0005.vo.WM_P0005VO;

public interface WM_P0005Service {
	 public List<WM_P0005VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
}
