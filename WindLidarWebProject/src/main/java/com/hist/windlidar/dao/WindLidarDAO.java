package com.hist.windlidar.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("windLidarDAO")
public class WindLidarDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectWindLidarList(Map<String, Object> map) throws Exception
	{
		// 실행할 쿼리 이름과 매개변수
		return (List<Map<String, Object>>)selectList("windlidar.selectLidarList", map);
	}
}
