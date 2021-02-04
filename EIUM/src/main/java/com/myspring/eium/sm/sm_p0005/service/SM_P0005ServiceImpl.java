package com.myspring.eium.sm.sm_p0005.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.sm.sm_p0005.dao.SM_P0005DAO;
import com.myspring.eium.sm.sm_p0005.vo.SM_P0005VO;


@Service
@Transactional(propagation = Propagation.REQUIRED)
public class SM_P0005ServiceImpl implements SM_P0005Service {
	@Autowired
	private SM_P0005DAO sM_P0005DAO;
	
	@Override
	public List<SM_P0005VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0005VO> list =  sM_P0005DAO.searchList(searchMap); 
		return list;
	}

	@Override
	public void saveData(Map<String, String[]> dataMap, String x, String user) throws DataAccessException {
		String[] status = dataMap.get("sStatus");
		int length = status.length; // row수
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i, x, user); // 현재 Index의 Row Map
			if("I".equals(str)) { // 추가
				sM_P0005DAO.insertData(row);
			}else if("U".equals(str)) { // 수정
				sM_P0005DAO.updateData(row);
			}else if("D".equals(str)) { // 삭제
				sM_P0005DAO.deleteData(row);
			}else if("".equals(str))  {
				
			}
			i++;
		}
	}

	private Map<String, String> getRow(Map<String, String[]> dataMap, int length, int i, String x, String user) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[i]);
				row.put("x", x);
				row.put("user",user);
			}
		}		
		return row;
	}


}
