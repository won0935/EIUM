package com.myspring.eium.sm.sm_p0005.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.sm.sm_p0005.vo.SM_P0005VO;

@Repository
public class SM_P0005DAOImpl implements SM_P0005DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SM_P0005VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SM_P0005VO> list = sqlSession.selectList("mapper.sm_p0005.searchList", searchMap);
		return list;
	}

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.sm_p0005.insertData", row);
		sqlSession.update("mapper.sm_p0005.insertData1", row);
		sqlSession.update("mapper.sm_p0005.insertData2", row);
		sqlSession.update("mapper.sm_p0005.insertData3", row);
		sqlSession.update("mapper.sm_p0005.insertData4", row);
		sqlSession.update("mapper.sm_p0005.insertData5", row);
		sqlSession.update("mapper.sm_p0005.insertData6", row);
		sqlSession.update("mapper.sm_p0005.insertData7", row);
		sqlSession.update("mapper.sm_p0005.insertData8", row);
		sqlSession.update("mapper.sm_p0005.insertData9", row);
		sqlSession.update("mapper.sm_p0005.insertData10", row);
		sqlSession.update("mapper.sm_p0005.insertData11", row);
		sqlSession.update("mapper.sm_p0005.insertData12", row);
		sqlSession.update("mapper.sm_p0005.insertData13", row);
		sqlSession.update("mapper.sm_p0005.insertData14", row);
		sqlSession.update("mapper.sm_p0005.insertData15", row);
		sqlSession.update("mapper.sm_p0005.insertData16", row);
		sqlSession.update("mapper.sm_p0005.insertData17", row);
		sqlSession.update("mapper.sm_p0005.insertData18", row);
		sqlSession.update("mapper.sm_p0005.insertData19", row);
		sqlSession.update("mapper.sm_p0005.insertData20", row);
		sqlSession.update("mapper.sm_p0005.insertData21", row);
		sqlSession.update("mapper.sm_p0005.insertData22", row);
		sqlSession.update("mapper.sm_p0005.insertData23", row);
		sqlSession.update("mapper.sm_p0005.insertData24", row);
		sqlSession.update("mapper.sm_p0005.insertData25", row);
		sqlSession.update("mapper.sm_p0005.insertData26", row);
		sqlSession.update("mapper.sm_p0005.insertData27", row);
		sqlSession.update("mapper.sm_p0005.insertData28", row);
		sqlSession.update("mapper.sm_p0005.insertData29", row);
		sqlSession.update("mapper.sm_p0005.insertData30", row);
		sqlSession.update("mapper.sm_p0005.insertData31", row);
		sqlSession.update("mapper.sm_p0005.insertData32", row);
		
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.sm_p0005.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.sm_p0005.deleteData", row);
		sqlSession.update("mapper.sm_p0005.deleteData1", row);
	}

}
