package com.myspring.eium.wm.wm_p0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.wm.wm_p0001.dao.WM_P0001DAO;
import com.myspring.eium.wm.wm_p0001.vo.WM_P0001VO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class WM_P0001ServiceImpl implements WM_P0001Service {
	@Autowired
	private WM_P0001DAO p0001DAO;

	@Override
	public List<WM_P0001VO> EMP_searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<WM_P0001VO> list =  p0001DAO.EMP_searchList(searchMap); 
		return list;
	}
	
	@Override
	public List<WM_P0001VO> WS_searchList(Map<String, String> searchMap) throws DataAccessException {
		List<WM_P0001VO> list = p0001DAO.WS_searchList(searchMap);
		return list;
	}	

	@Override
	public List<WM_P0001VO> TWS_searchList(Map<String, String> searchMap) throws DataAccessException {
		List<WM_P0001VO> list = p0001DAO.TWS_searchList(searchMap);
		return list;
	}
	
	@Override
	public void saveData(Map<String, String[]> dataMap, String P_EMPLOYEE_CODE, String u)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row수
		int i = 0;
		System.out.println("^^^^^^^^^^^^^");
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i, P_EMPLOYEE_CODE, u); 
			if("I".equals(str)) { // 추가
				p0001DAO.insertData(row);
				System.out.println("^^^^^^^^^insert");
			}else if("U".equals(str)) { // 수정
				p0001DAO.updateData(row);
				System.out.println("^^^^^^^^^update");
			}else if("D".equals(str)) { // 삭제
				p0001DAO.deleteData(row);
				System.out.println("^^^^^^^^^delete");
			}
			i++;
		}
	}
	
	@Override
	public void TWS_saveData(Map<String, String[]> dataMap, String PP_EMPLOYEE_CODE, String P_WS_MONTH, String u)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row수
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow_sheet3(dataMap, length, i, PP_EMPLOYEE_CODE, P_WS_MONTH, u); 
			if("I".equals(str)) { // sheet3 총 근태 결과 추가
				p0001DAO.TWS_insertData(row);
				p0001DAO.WS_YN_updateData(row);
			}else if("U".equals(str)) { // 수정
				p0001DAO.TWS_insertData(row);
				p0001DAO.WS_YN_updateData(row);
			}
			
			i++;
			//수정해야할듯
		}
	}
	//마감취소 클릭시
	@Override
	public void WS_YN_rollbackData(Map<String, String[]> dataMap, String PP_EMPLOYEE_CODE, String P_WS_MONTH, String u)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row수
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow_sheet3(dataMap, length, i, PP_EMPLOYEE_CODE, P_WS_MONTH, u); 
			if("U".equals(str)) { // 수정
				p0001DAO.WS_YN_rollbackData(row);
			}
			i++;
		}
	}
	//정산 클릭시
	@Override
	public void SUM_saveData(Map<String, String[]> dataMap, String PP_EMPLOYEE_CODE, String P_WS_MONTH, String u)
			throws DataAccessException {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row수
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow_sheet3(dataMap, length, i, PP_EMPLOYEE_CODE, P_WS_MONTH, u); 
			if("I".equals(str)) { // sheet3 총 근태 결과 추가
				p0001DAO.TWS_insertData(row);
			}else if("U".equals(str)) { // 수정
				p0001DAO.TWS_insertData(row);
			}
			
			i++;
			//수정해야할듯
		}
		
	}
	private Map<String, String> getRow(Map<String, String[]> dataMap, int length, int index, String P_EMPLOYEE_CODE, String u) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
				row.put("P_EMPLOYEE_CODE", P_EMPLOYEE_CODE);
				row.put("PP_EMPLOYEE_CODE", P_EMPLOYEE_CODE);
				row.put("user", u); // user에 파라미터값을 넣어 저장해준다.
			}
		}		
		return row;
	}
	
	private Map<String, String> getRow_sheet3(Map<String, String[]> dataMap, int length, int index, String P_EMPLOYEE_CODE, String P_WS_MONTH, String u) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
				row.put("P_EMPLOYEE_CODE", P_EMPLOYEE_CODE);
				row.put("PP_EMPLOYEE_CODE", P_EMPLOYEE_CODE);
				row.put("P_WS_MONTH", P_WS_MONTH);
				row.put("user", u); // user에 파라미터값을 넣어 저장해준다.
			}
		}		
		return row;
	}



	

	/*
	 * @Override public void WS_YN_updateData(String YN_EMP_CODE, String
	 * YN_WS_MONTH) throws DataAccessException {
	 * 
	 * p0001DAO.WS_YN_updateData(YN_EMP_CODE, YN_WS_MONTH); }
	 */
	
	
	
}
