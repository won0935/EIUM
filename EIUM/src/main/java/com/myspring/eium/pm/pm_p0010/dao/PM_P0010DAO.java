package com.myspring.eium.pm.pm_p0010.dao;





import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.pm.pm_p0010.vo.PM_P0010VO;




public interface PM_P0010DAO {
	 public List<PM_P0010VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public List<PM_P0010VO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
	 public List<PM_P0010VO> searchList3(Map<String, Object> searchMap) throws DataAccessException;

		
}
