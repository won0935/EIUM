package com.myspring.eium.sm.sm_p0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.sm.sm_p0001.dao.SM_P0001DAO;
import com.myspring.eium.sm.sm_p0001.vo.SM_P0001VO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class SM_P0001ServiceImpl implements SM_P0001Service {
	
	@Autowired
	private SM_P0001DAO sM_P0001DAO;

	@Override
	public List<SM_P0001VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0001VO> list =  sM_P0001DAO.searchList(searchMap); 
		return list;
	}

	@Override
	public void saveData(Map<String, String[]> dataMap, String u)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		System.out.println("status :"+ status);
		int length = status.length; // row수
		System.out.println("P0001ServiceImpl-length:"+length);
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i, u); // 현재 Index의 Row Map
			if("I".equals(str)) { // 추가
				sM_P0001DAO.insertData(row);
			}else if("U".equals(str)) { // 수정
				sM_P0001DAO.updateData(row);
			}else if("D".equals(str)) { // 삭제
				sM_P0001DAO.deleteData(row);
			}
			i++;
		}
	}
	
	private Map<String, String> getRow(Map<String, String[]> dataMap, int length, int index, String u) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
				row.put("user", u); // user에 파라미터값을 넣어 저장해준다.
			}
		}		
		return row;
	}	
}
