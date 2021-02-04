package com.myspring.eium.hm.hm_p0021.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.hm.hm_p0021.dao.HM_P0021DAO;
import com.myspring.eium.hm.hm_p0021.vo.HM_P0021VO;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0021ServiceImpl implements HM_P0021Service{

	@Autowired
	private HM_P0021DAO hM_P0021DAO;
	@Override
	public List<HM_P0021VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0021VO> list =  hM_P0021DAO.searchList(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0021VO> eduScoreSearch(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0021VO> list =  hM_P0021DAO.eduScoreSearch(searchMap); 
		return list;
	}
	
	
	
	
	
	
	@Override
	public void saveData(Map<String, String[]> dataMap,String u) throws DataAccessException {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row수
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i,u); // 현재 Index의 Row Map
		 if("U".equals(str)) { // 수정
				hM_P0021DAO.updateData(row);
			}else if("D".equals(str)) { // 삭제
				hM_P0021DAO.deleteData(row);
			}
			i++;
		}
	}
	
	
	private Map getRow(Map<String, String[]> dataMap, int length, int index,String u) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
				row.put("user", u);

			}
		}		
		return row;
	}
}


