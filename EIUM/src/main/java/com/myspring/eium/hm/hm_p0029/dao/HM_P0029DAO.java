package com.myspring.eium.hm.hm_p0029.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.web.multipart.MultipartFile;

import com.myspring.eium.hm.hm_p0029.vo.HM_P0029VO;

public interface HM_P0029DAO {
	// 코드 도움 팝업 (전체)
	public List<HM_P0029VO> searchList2(Map<String, Object> searchMap) throws DataAccessException;

	// 사업장 팝업 dao
	public List<HM_P0029VO> searchList_site(Map<String, Object> searchMap) throws DataAccessException;

	//TN 교육, BN 출장, LI 자격/면허, LA 어학시험
	public List<HM_P0029VO> searchList_TN(Map<String, Object> searchMap) throws DataAccessException;
	public List<HM_P0029VO> searchList_BN(Map<String, Object> searchMap) throws DataAccessException;
	public List<HM_P0029VO> searchList_LI(Map<String, Object> searchMap) throws DataAccessException;
	public List<HM_P0029VO> searchList_LA(Map<String, Object> searchMap) throws DataAccessException;
}
