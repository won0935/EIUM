package com.myspring.eium.hm.hm_p0003.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.hm.hm_p0003.dao.HM_P0003DAO;
import com.myspring.eium.hm.hm_p0003.vo.HM_P0003VO;


@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0003ServiceImpl implements HM_P0003Service {
	@Autowired
	private HM_P0003DAO p0003DAO;

	@Override
	public List<HM_P0003VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0003VO> list =  p0003DAO.searchList(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0003VO> searchList2(Map<String, String> searchMap) throws DataAccessException {
		List<HM_P0003VO> list =  p0003DAO.searchList2(searchMap); 		
		return list;
	}

	@Override
	public void saveData(Map<String, String[]> dataMap,String t_name)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; 
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); 
			row.put("temp_NAME", t_name);
			if("I".equals(str)) { 
				p0003DAO.insertData(row);
			}else if("U".equals(str)) { 
				p0003DAO.updateData(row);
			}else if("D".equals(str)) { 
				p0003DAO.deleteData(row);
			}
			i++;
		}
	}
	
	private Map<String, String> getRow(Map<String, String[]> dataMap, int length, int index) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
			}
		}		
		return row;
	}	
}
