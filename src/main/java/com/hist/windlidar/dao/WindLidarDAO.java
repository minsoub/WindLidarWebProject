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
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectWindLidarPerHour(Map<String, Object> map) throws Exception
	{
		return (List<Map<String, Object>>)selectList("windlidar.selectWindLidarPerHour", map);
	}
	
	/**
	 * 일별 관측자료 수신 통계 조회
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectWindLidarPerDay(Map<String, Object> map) throws Exception
	{
		return (List<Map<String, Object>>)selectList("windlidar.selectWindLidarPerDay", map);
	}
	
	/**
	 * 월별 관측자료 수신 통계 조회
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectWindLidarPerMon(Map<String, Object> map) throws Exception
	{
		return (List<Map<String, Object>>)selectList("windlidar.selectWindLidarPerMon", map);
	}
}
