package com.myspring.eium.wm.wm_p0005.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.wm.wm_p0005.vo.WM_P0005VO;


public interface WM_P0005DAO {

	public List<WM_P0005VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

}
