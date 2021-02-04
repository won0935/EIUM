package com.myspring.eium.pm.pm_p0002.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.pm.pm_p0002.dao.PM_P0002DAO;
import com.myspring.eium.pm.pm_p0002.vo.PM_P0002VO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class PM_P0002ServiceImpl implements PM_P0002Service {
	@Autowired
	private PM_P0002DAO p0002DAO;

	@Override
	public List<PM_P0002VO> searchTypeList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0002VO> list =  p0002DAO.typeList(searchMap); 
		return list;
	}
	
	
	
	@Override
	public List<PM_P0002VO> paygrade_searchData(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0002VO> list =  p0002DAO.paygradeList(searchMap); 
		return list;
	}
	@Override
	public List<PM_P0002VO> paydate_searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0002VO> list =  p0002DAO.paydate_searchList(searchMap); 
		return list;
	}
	
	@Override
	public List<PM_P0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0002VO> list =  p0002DAO.searchList(searchMap); 
		return list;
	}
	
	@Override
	public List<PM_P0002VO> searchReceipt(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0002VO> list =  p0002DAO.searchReceipt(searchMap); 
		return list;
	}

	@Override
	public void saveData(Map<String, String[]> dataMap, String user,String x, String y)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row��
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i, user, x, y); // ���� Index�� Row Map
			if("I".equals(str)) { // �߰�
				p0002DAO.insertData(row);
			}else if("U".equals(str)) { // ����
				p0002DAO.updateData(row);
			}else if("D".equals(str)) { // ����
				p0002DAO.deleteData(row);
			}
			i++;
		}
	}
	
	private Map<String, String> getRow(Map<String, String[]> dataMap, int length, int index, String user, String x, String y) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
				row.put("user", user);
				row.put("x", x);
				row.put("y", y);


			}
		}		
		return row;
	}

	
}
