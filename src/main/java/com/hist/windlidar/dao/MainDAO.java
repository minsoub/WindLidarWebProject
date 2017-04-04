package com.hist.windlidar.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("mainDAO")
public class MainDAO extends AbstractDAO {
	
	/**
	 * �����ͺ��̽����� �Ķ���� ������ ��ȸ�Ѵ�.
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
	 * �˶� �����͸� ��ȸ�Ѵ�.
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
	 * ���� ���� �ð������� �������� �����Ѵ�.
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
	 * ���� ������  �������� �����Ѵ�.
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
