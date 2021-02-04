package com.myspring.eium.common.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.myspring.eium.common.vo.HomeVO;


@Repository("HomeDAO")
public class HomeDAO{
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	HomeVO homeVO;
	

	public HomeVO findId(Map<String, Object> searchMap) {
		homeVO = sqlSession.selectOne("mapper.common.findId",searchMap);
		return homeVO;
	}
	public HomeVO findPwd(Map<String, Object> searchMap) {
		homeVO = sqlSession.selectOne("mapper.common.findPwd", searchMap);
		return homeVO;
	}
	
	public List<HomeVO> findvacation(String emp_id){
		String answer =  sqlSession.selectOne("mapper.common.findVacationAuth",emp_id);
		List<HomeVO> list = new ArrayList<HomeVO>();
		if("사업장".equals(answer)) {
			list = sqlSession.selectList("mapper.common.findAllVacation",emp_id);			
		}else {
			list = sqlSession.selectList("mapper.common.findLimitedVacation",emp_id);		
		}
		return list;
	}
	public List<HomeVO> findbusiness(String emp_id){
		String answer =  sqlSession.selectOne("mapper.common.findBusinessAuth",emp_id);
		List<HomeVO> list = new ArrayList<HomeVO>();
		if("사업장".equals(answer)) {
			list = sqlSession.selectList("mapper.common.findAllBusiness",emp_id);			
		}else {
			list = sqlSession.selectList("mapper.common.findLimitedBusiness",emp_id);		
		}
		return list;
	}
	public List<HomeVO> findboard(String emp_id){
		List<HomeVO> list = sqlSession.selectList("mapper.common.findboard",emp_id);
		return list;
	}
	public void boardInsert(Map<String, Object> map) {
		sqlSession.update("mapper.common.insertData", map);
		
	}
	public void boardUpdate(Map<String, Object> map) {
		sqlSession.update("mapper.common.updateData", map);
		
	}
	public void boardDelete(Integer board_CODE) {
		sqlSession.update("mapper.common.deleteData", board_CODE);
		
	}
	

}
