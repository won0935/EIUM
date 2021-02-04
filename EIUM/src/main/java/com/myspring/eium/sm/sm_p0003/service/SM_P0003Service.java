package com.myspring.eium.sm.sm_p0003.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.sm.sm_p0003.vo.SM_P0003VO;

public interface SM_P0003Service {

	public List<SM_P0003VO> searchList(Map<String, Object> searchMap) throws DataAccessException;


	public List<SM_P0003VO> searchpopup(Map<String, Object> searchMap) throws DataAccessException;


	public List<SM_P0003VO> searchSiteList(Map<String, Object> searchMap) throws DataAccessException;

	public void saveData(Map<String, String[]> dataMap, String u) throws DataAccessException;


	public void saveDatapopup(Map<String, String[]> dataMap, String u) throws DataAccessException;



}
