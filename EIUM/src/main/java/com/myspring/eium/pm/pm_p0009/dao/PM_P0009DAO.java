package com.myspring.eium.pm.pm_p0009.dao;





import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.web.multipart.MultipartFile;

import com.myspring.eium.pm.pm_p0009.vo.PM_P0009VO;




public interface PM_P0009DAO {
	 public List<PM_P0009VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

		
}
