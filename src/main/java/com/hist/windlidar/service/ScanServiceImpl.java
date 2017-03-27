package com.hist.windlidar.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hist.windlidar.dao.ScanDAO;

@Service("scanService")
public class ScanServiceImpl implements ScanService {


	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="scanDAO")
	private ScanDAO scanDAO;
	
	/**
	 * 데이터베이스를 조회하는 DAO의 멤버함수를 호출해서 데이터를 List객체로 가져온다.
	 * 가져온 데이터는 Controller 클래스에 넘겨준다.
	 */
	@Override
	public List<Map<String, Object>> selectScanParameterList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return scanDAO.selectScanParameterList(commandMap);
	}

	/**
	 * Scanning Parameter의 총개수를 조회해서 리턴한다.
	 * 
	 */
	@Override
	public int selectScanCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> result = scanDAO.selectScanCount(commandMap);
		
		if (result != null)
		{
			int cnt = Integer.parseInt(result.get("CNT").toString());
			return cnt;
		}
		else
		{
			return 0;
		}
	}

}
