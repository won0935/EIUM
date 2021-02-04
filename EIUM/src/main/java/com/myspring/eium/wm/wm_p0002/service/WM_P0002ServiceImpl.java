package com.myspring.eium.wm.wm_p0002.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.wm.wm_p0002.dao.WM_P0002DAO;
import com.myspring.eium.wm.wm_p0002.vo.WM_P0002VO;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class WM_P0002ServiceImpl implements WM_P0002Service {
	@Autowired
	private WM_P0002DAO WM_P0002DAO;
	
	@Override
	public List<WM_P0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<WM_P0002VO> list =  WM_P0002DAO.searchList(searchMap); 
		return list;
	}

	public List<WM_P0002VO> searchEmployeeList(Map<String, Object> searchMap) {
		List<WM_P0002VO> list=WM_P0002DAO.searchEmployeeList(searchMap);

		return list;
	}

	@Override
	public void saveData(Map<String, String[]> dataMap, String x, String user) throws DataAccessException {
		
		String[] status = dataMap.get("sStatus");
		int length = status.length; // row��
		int i = 0;
		
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i, x, user); // ���� Index�� Row Map
			if("I".equals(str)) { // 추가
				WM_P0002DAO.updateData(row);
			}else if("U".equals(str)) { // 수정
				WM_P0002DAO.updateData2(row);
			}
			else if("D".equals(str)) { // 삭제
				WM_P0002DAO.deleteData(row);
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
				row.put("user", user);
			}
		}		
		return row;
	}

}
