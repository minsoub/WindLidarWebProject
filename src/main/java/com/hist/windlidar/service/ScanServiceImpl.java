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
	 * �����ͺ��̽��� ��ȸ�ϴ� DAO�� ����Լ��� ȣ���ؼ� �����͸� List��ü�� �����´�.
	 * ������ �����ʹ� Controller Ŭ������ �Ѱ��ش�.
	 */
	@Override
	public List<Map<String, Object>> selectScanParameterList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return scanDAO.selectScanParameterList(commandMap);
	}

	/**
	 * Scanning Parameter�� �Ѱ����� ��ȸ�ؼ� �����Ѵ�.
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
