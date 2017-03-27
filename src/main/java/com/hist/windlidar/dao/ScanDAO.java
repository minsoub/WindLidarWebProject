package com.hist.windlidar.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("scanDAO")
public class ScanDAO  extends AbstractDAO {

	/**
	 * Scanning Parameter �����͸� ��ȸ�Ѵ�.
	 * ��� ������ �����Ƿ� ����¡�� ó���Ѵ�.
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectScanParameterList(Map<String, Object> map) throws Exception
	{
		return (List<Map<String, Object>>) selectList("windlidar.selectScanList", map);
	}
	
	/**
	 * Scanning Parameter�� �� ������ ��ȸ�Ѵ�.
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectScanCount(Map<String, Object> map) throws Exception
	{
		return (Map<String, Object>)selectOne("windlidar.selectScanCount", map);
	}
}
