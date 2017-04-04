package com.hist.windlidar.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("mainDAO")
public class MainDAO extends AbstractDAO {
	
	/**
	 * 데이터베이스에서 파라미터 정보를 조회한다.
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectParamInfo(Map<String, Object> map) throws Exception
	{
		return (Map<String, Object>)selectOne("windlidar.selectParamInfo", map);
	}
	
	/**
	 * 알람 데이터를 조회한다.
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectAlaramInfo(Map<String, Object> map) throws Exception
	{
		return (Map<String, Object>)selectOne("windlidar.selectAlaramInfo", map);
	}
	
	/**
	 * 금일 현재 시각까지의 수신율을 리턴한다.
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRcvRateToday(Map<String, Object> map) throws Exception
	{
		return (List<Map<String, Object>>)selectList("windlidar.selectRcvRateToday", map);
	}
	
	/**
	 * 금일 어제의  수신율을 리턴한다.
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRcvRateYesterDay(Map<String, Object> map) throws Exception
	{
		return (List<Map<String, Object>>)selectList("windlidar.selectRcvRateYesterDay", map);
	}
}
