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
	
	/**
	 * 시간대별 관측자료 데이터를 조회한다.
	 * 시간대에별 한 ROW씩 데이터가 조회된다. 조회된 데이터를 Map에 저장되어 리턴된다.
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectWindLidarPerHour(Map<String, Object> map) throws Exception
	{
		return (Map<String, Object>)selectOne("windlidar.selectWindLidarPerHour", map);
	}
}
