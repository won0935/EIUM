package com.myspring.eium.sm.sm_p0004.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.sm.sm_p0004.dao.SM_P0004DAO;
import com.myspring.eium.sm.sm_p0004.vo.SM_P0004VO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class SM_P0004ServiceImpl implements SM_P0004Service {
	@Autowired
	private SM_P0004DAO p0004DAO;

//	@Override
//	public List listMembers() throws DataAccessException {
//		List p0004List = null;
//		p0004List = p0004DAO.selectAllp0004List();
//		return p0004List;
//	}

//	@Override
//	public p0004VO login(p0004VO p0004VO) throws Exception {
//		return p0004DAO.loginById(p0004VO); 
//	}

	
	
	@Override
	public List<SM_P0004VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0004VO> list =  p0004DAO.searchList(searchMap);
		return list;
	}

	@Override
	public void saveData(Map<String, String[]> dataMap, String u) throws DataAccessException {
		String[] status = dataMap.get("sStatus");
		int length = status.length; // row수
		int i = 0;
		String user = u;

		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i, u);  // 현재 Index의 Row Map
			if("I".equals(str)) { // 추가
				p0004DAO.insertData(row);
			}else if("U".equals(str)) { // 수정
				p0004DAO.updateData(row);
			}else if("D".equals(str)) { // 삭제
				p0004DAO.deleteData(row);
			}
			i++;
		}
	}

	private Map<String, String> getRow(Map<String, String[]> dataMap, int length, int i, String u) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[i]);
				row.put("user", u);
			}
		}		
		return row;
	}

	public List<SM_P0004VO> companyList(Map<String, Object> searchMap)throws DataAccessException {
		List<SM_P0004VO> list =  p0004DAO.companyList(searchMap);
		return list;
	}
	

	


	


}
