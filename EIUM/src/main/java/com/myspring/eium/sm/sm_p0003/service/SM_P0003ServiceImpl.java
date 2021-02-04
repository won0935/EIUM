package com.myspring.eium.sm.sm_p0003.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.sm.sm_p0003.dao.SM_P0003DAO;
import com.myspring.eium.sm.sm_p0003.vo.SM_P0003VO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class SM_P0003ServiceImpl implements SM_P0003Service {

	@Autowired
	private SM_P0003DAO sM_P0003DAO;

	@Override
	public List<SM_P0003VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0003VO> list=sM_P0003DAO.searchList(searchMap);

		return list;
	}



	@Override
	public void saveData(Map<String, String[]> dataMap,String u) throws DataAccessException {
		String[] status = dataMap.get("Status");
		int length = status.length; // row수
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i,u); // 현재 Index의 Row Map
			if("I".equals(str)) { // 추가
				sM_P0003DAO.insertData(row);
			}else if("U".equals(str)) { // 수정
				sM_P0003DAO.updateData(row);
			}else if("D".equals(str)) { // 삭제
				sM_P0003DAO.deleteData(row);
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
				row.put("user",u);
			}
		}		
		return row;
	}
	
	
	

	@Override
	public List<SM_P0003VO> searchpopup(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0003VO> list=sM_P0003DAO.searchpopup(searchMap);

		return list;
	}
	
	@Override
	public void saveDatapopup(Map<String, String[]> dataMap,String u) throws DataAccessException {
		String[] status = dataMap.get("Status");
		int length = status.length; // row��
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i,u); // ���� Index�� Row Map
			if("I".equals(str)) { // �߰�
				sM_P0003DAO.insertDatapopup(row);
			}else if("U".equals(str)) { // ����
				sM_P0003DAO.updateDatapopup(row);
			}else if("D".equals(str)) { // ����
				sM_P0003DAO.deleteDatapopup(row);
			}
			i++;
		}
	}
	
	@Override
	public List<SM_P0003VO> searchSiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0003VO> list=sM_P0003DAO.searchSiteList(searchMap);

		return list;
	}
	
	
	
	
}
