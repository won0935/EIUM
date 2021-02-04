package com.myspring.eium.sm.sm_p0004.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.sm.sm_p0003.vo.SM_P0003VO;
import com.myspring.eium.sm.sm_p0004.vo.SM_P0004VO;

@Repository
public class SM_P0004DAOImpl implements SM_P0004DAO {
	@Autowired
	private SqlSession sqlSession;

//	@Override
//	public List selectAllp0004List() throws DataAccessException {
//		List<p0004VO> membersList = null;
//		membersList = sqlSession.selectList("mapper.sm.selectAllp0004List");
//		return membersList;
//	}

//	@Override
//	public int deleteMember(String id) throws DataAccessException {
//		int result = sqlSession.delete("mapper.sm.deleteMember", id);
//		return result;
//	}

//	@Override
//	public p0004VO loginById(p0004VO p0004VO) throws DataAccessException {
//		p0004VO vo = sqlSession.selectOne("mapper.sm.loginById", p0004VO);
//		return vo;
//	}

	@Override
	public List<SM_P0004VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0004VO> list = sqlSession.selectList("mapper.sm_p0004.selectAllp0004List", searchMap);
		return list;
	}
	
	@Override
	public List<SM_P0004VO> companyList(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0004VO> list = sqlSession.selectList("mapper.sm_p0004.companyList", searchMap);
		return list;
	}

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.sm_p0004.insertData1", row);
		sqlSession.update("mapper.sm_p0004.insertData2", row);
		sqlSession.update("mapper.sm_p0004.insertData3", row);
		sqlSession.update("mapper.sm_p0004.insertData4", row);
		sqlSession.update("mapper.sm_p0004.insertData5", row);


	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.sm_p0004.updateData1", row);
		sqlSession.update("mapper.sm_p0004.updateData2", row);
		sqlSession.update("mapper.sm_p0004.updateData3", row);
		sqlSession.update("mapper.sm_p0004.updateData4", row);

	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.sm_p0004.deleteData1", row);
		sqlSession.update("mapper.sm_p0004.deleteData2", row);
		sqlSession.update("mapper.sm_p0004.deleteData3", row);
		sqlSession.update("mapper.sm_p0004.deleteData4", row);
		sqlSession.update("mapper.sm_p0004.deleteData5", row);
		sqlSession.update("mapper.sm_p0004.deleteData6", row);
		sqlSession.update("mapper.sm_p0004.deleteData7", row);
		sqlSession.update("mapper.sm_p0004.deleteData8", row);
		sqlSession.update("mapper.sm_p0004.deleteData9", row);
		sqlSession.update("mapper.sm_p0004.deleteData10", row);
		sqlSession.update("mapper.sm_p0004.deleteData11", row);
		sqlSession.update("mapper.sm_p0004.deleteData12", row);
		sqlSession.update("mapper.sm_p0004.deleteData13", row);
		sqlSession.update("mapper.sm_p0004.deleteData14", row);
		sqlSession.update("mapper.sm_p0004.deleteData15", row);
		sqlSession.update("mapper.sm_p0004.deleteData16", row);
		sqlSession.update("mapper.sm_p0004.deleteData17", row);
		sqlSession.update("mapper.sm_p0004.deleteData18", row);
		sqlSession.update("mapper.sm_p0004.deleteData19", row);
		sqlSession.update("mapper.sm_p0004.deleteData20", row);
		sqlSession.update("mapper.sm_p0004.deleteData21", row);
		sqlSession.update("mapper.sm_p0004.deleteData22", row);


	}
	

}
