package com.hist.windlidar.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("scanDAO")
public class ScanDAO  extends AbstractDAO {

	/**
	 * Scanning Parameter 데이터를 조회한다.
	 * 등록 개수가 많으므로 페이징을 처리한다.
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
	 * Scanning Parameter의 총 개수를 조회한다.
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
