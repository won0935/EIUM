package com.myspring.eium.hm.hm_p0001.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.hm.hm_p0001.dao.HM_P0001DAO;
import com.myspring.eium.hm.hm_p0001.vo.HM_P0001VO;





@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0001ServiceImpl implements HM_P0001Service {
	@Autowired
	private HM_P0001DAO p0001DAO;

	@Override
	public List<HM_P0001VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0001VO> list =  p0001DAO.searchList(searchMap); 
		return list;
	}
	
	@Override
	public List<HM_P0001VO> searchList2(Map<String, String> searchMap) throws DataAccessException {
		List<HM_P0001VO> list = p0001DAO.searchList2(searchMap);
		return list;
	}	
	
	@Override
	public List<HM_P0001VO> searchList3(Map<String, String> searchMap) throws DataAccessException {
		List<HM_P0001VO> list = p0001DAO.searchList3(searchMap);
		return list;
	}
	@Override
	public void saveData(Map<String, String[]> dataMap, String p_position_CODE, String PP_START_DATE, String u)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; 
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i, p_position_CODE, PP_START_DATE, u); 
			if("I".equals(str)) { 
				p0001DAO.insertData(row);
			}else if("U".equals(str)) { 
				p0001DAO.DATE_updateData(row);
			}else if("D".equals(str)) { 
				p0001DAO.DATE_deleteData(row);
			}
			i++;
		}
	}
	
	@Override
	public void SALARY_saveData(Map<String, String[]> dataMap, String p_position_CODE, String PP_START_DATE, String u) throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; 
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i, p_position_CODE, PP_START_DATE, u); 
			if("U".equals(str)) { 
				p0001DAO.SALARY_updateData(row);
			}
			i++;
		}
	}
	@Override
	public void DATE_deleteData(Map<String, String[]> dataMap, String p_position_CODE, String PP_START_DATE, String u) throws DataAccessException {
		String[] status = dataMap.get("STATUS");
		int length = status.length; 
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i, p_position_CODE, PP_START_DATE, u); 
			if("D".equals(str)) { 
				p0001DAO.DATE_deleteData(row);
				p0001DAO.BACKDATE_updateData(row);
			}
			i++;
		}
		
	}
	
	private Map<String, String> getRow(Map<String, String[]> dataMap, int length, int index, String p_position_CODE, String PP_START_DATE, String u) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
				row.put("p_position_CODE", p_position_CODE);
				row.put("PP_START_DATE", PP_START_DATE);
				row.put("user", u); // user에 파라미터값을 넣어 저장해준다.
			}
		}		
		return row;
	}

	

	
}
