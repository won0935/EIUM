package com.myspring.eium.hm.hm_p0004.dao;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.myspring.eium.hm.hm_p0004.vo.HM_P0004VO;



@Repository
public class HM_P0004DAOImpl implements HM_P0004DAO {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	HM_P0004VO p0004Vo;
	

	@Override
	public List<HM_P0004VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0004VO> list = sqlSession.selectList("mapper.hm_p0004.searchList", searchMap);
		return list;
	}
	@Override
	public List<HM_P0004VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0004VO> list = sqlSession.selectList("mapper.hm_p0004.searchList2", searchMap);
		return list;
	}
	
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0004.insertData", row);
		sqlSession.update("mapper.hm_p0004.insertData2", row);
		sqlSession.update("mapper.hm_p0004.insertData3", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0004.updateData", row);
		/* sqlSession.update("mapper.hm_p0004.updateData2", row); */
		sqlSession.update("mapper.hm_p0004.updateData3", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0004.deleteData", row);
	}
	
	@Override
	public void saveFile(Map<String, Object> dataMap ) throws DataAccessException {
		
		sqlSession.update("mapper.hm_p0004.insertFile", dataMap);
	}
	
	@Override
	public Map<String, Object> getByteImage(Map<String, Object> searchMap) {
		return sqlSession.selectOne("mapper.hm_p0004.getByteImage" ,searchMap);
	}
	
	@Override
	public List<HM_P0004VO> searchContract(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0004VO> list = sqlSession.selectList("mapper.hm_p0004.searchContract", searchMap);
		return list;
	}
	
	@Override
	public void insertData2(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0004.insertContract", row);
	}
	
	@Override
	public void updateData2(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0004.updateContract", row);
	}
	
	@Override
	public void deleteData2(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0004.deleteContract", row);
	}


}
