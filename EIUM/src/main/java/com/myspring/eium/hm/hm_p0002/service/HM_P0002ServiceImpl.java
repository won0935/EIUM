package com.myspring.eium.hm.hm_p0002.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.hm.hm_p0002.dao.HM_P0002DAO;
import com.myspring.eium.hm.hm_p0002.vo.HM_P0002VO;






@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0002ServiceImpl implements HM_P0002Service {
	@Autowired
	private HM_P0002DAO p0002DAO;

	@Override
	public List<HM_P0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0002VO> list =  p0002DAO.searchList(searchMap); 
		return list;
	}
	
	@Override
	public List<HM_P0002VO> searchSelect(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0002VO> list =  p0002DAO.searchSelect(searchMap); 
		return list;
	}
	
	
	@Override
	public List<HM_P0002VO> searchSiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0002VO> list =  p0002DAO.searchSiteList(searchMap); 
		return list;
	}
	
	@Override
	public List<HM_P0002VO> searchJobclassList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0002VO> list =  p0002DAO.searchJobclassList(searchMap); 
		return list;
	}

	@Override
	public void saveData(Map<String, String[]> dataMap, String user)  throws DataAccessException  {
		String[] status = dataMap.get("Status");
		int length = status.length; 
		int i = 0;

		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i, user); 
			if("I".equals(str)) { 
				p0002DAO.insertData(row);
			}else if("U".equals(str)) { 
				p0002DAO.updateData(row);
			}else if("D".equals(str)) { 
				p0002DAO.deleteData(row);
			}
			i++;
		}
	}
	
	private Map<String, String> getRow(Map<String, String[]> dataMap, int length, int index, String user) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
				row.put("user", user);


			}
		}		
		return row;
	}	
	
	@Override
	public void saveSelect(Map<String, String[]> dataMap2, String user2, String x2)  throws DataAccessException  {
		String[] status = dataMap2.get("Status");

		int length = status.length; 
		int i = 0;

		
		for(String str : status) {
			Map<String, String> row2 = getRow2(dataMap2, length, i, user2, x2); 
			if("I".equals(str)) { 
				p0002DAO.insertselect(row2);
			}else if("U".equals(str)) { 
				p0002DAO.updateselect(row2);
			}else if("D".equals(str)) { 
				p0002DAO.deleteselect(row2);
			}
			i++;
		}
	}


	private Map<String, String> getRow2(Map<String, String[]> dataMap, int length, int index, String user, String x) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
				row.put("user", user);
				row.put("x", x);


			}
		}		
		return row;
	}	
}
