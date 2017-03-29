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
	 * �ð��뿡�� �� ROW�� �����Ͱ� ��ȸ�ȴ�. ��ȸ�� �����͸� Map�� ����Ǿ� ���ϵȴ�.
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
