package com.myspring.eium.pm.pm_p0004.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.pm.pm_p0004.dao.PM_P0004DAO;
import com.myspring.eium.pm.pm_p0004.vo.PM_P0004VO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class PM_P0004ServiceImpl implements PM_P0004Service {
	@Autowired
	private PM_P0004DAO p0004DAO;

	@Override
	public List<PM_P0004VO> searchTypeList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0004VO> list =  p0004DAO.typeList(searchMap); 
		return list;
	}
	
	
	
	@Override
	public List<PM_P0004VO> paygrade_searchData(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0004VO> list =  p0004DAO.paygradeList(searchMap); 
		return list;
	}
	@Override
	public List<PM_P0004VO> paydate_searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0004VO> list =  p0004DAO.paydate_searchList(searchMap); 
		return list;
	}
	
	@Override
	public List<PM_P0004VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0004VO> list =  p0004DAO.searchList(searchMap); 
		return list;
	}
	
	@Override
	public List<PM_P0004VO> searchReceipt(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0004VO> list =  p0004DAO.searchReceipt(searchMap); 
		return list;
	}
	
	@Override
	public List<PM_P0004VO> BankList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0004VO> list =  p0004DAO.BankList(searchMap); 
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
				p0004DAO.insertData(row);
			}else if("U".equals(str)) { // ����
				p0004DAO.updateData(row);
			}else if("D".equals(str)) { // ����
				p0004DAO.deleteData(row);
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
