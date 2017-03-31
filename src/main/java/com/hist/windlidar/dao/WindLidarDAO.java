package com.hist.windlidar.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("windLidarDAO")
public class WindLidarDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectWindLidarList(Map<String, Object> map) throws Exception
	{
		// ������ ���� �̸��� �Ű�����
		return (List<Map<String, Object>>)selectList("windlidar.selectLidarList", map);
	}
	
	/**
	 * �ð��뺰 �����ڷ� �����͸� ��ȸ�Ѵ�.
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
	 * �Ϻ� �����ڷ� ���� ��� ��ȸ
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
	 * ���� �����ڷ� ���� ��� ��ȸ
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
