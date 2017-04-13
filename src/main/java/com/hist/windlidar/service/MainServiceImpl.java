package com.hist.windlidar.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hist.windlidar.common.CommonUtil;
import com.hist.windlidar.dao.MainDAO;

@Service("mainService")
public class MainServiceImpl implements MainService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mainDAO")
	private MainDAO mainDAO;
	
	/**
	 * Scanning Parameter ������ ��ȸ�Ѵ�. �ֽ� �Ѱ��� ��ȸ�Ѵ�.
	 */
	@Override
	public Map<String, Object> selectParamInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> info = mainDAO.selectParamInfo(commandMap);
		
		log.info("s_code : " + commandMap.get("s_code"));
		if (info == null)
		{
			info = new HashMap<String, Object>();
		}
		return info;
	}

	/**
	 * Alaram������ ��ȸ�Ѵ�.
	 * Alaram ������ ��� �����Ͱ� XML �����ͷ� �Ǿ� ������ �� �κ��� �Ľ��ؼ� Ű�� �����ؼ� Map�� ��´�.
	 * 
	 */
	@Override
	public Map<String, Object> selectAlaramInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> info = mainDAO.selectAlaramInfo(commandMap);
		
		// xml �����͸� �Ľ��Ѵ�.
		if (info == null)
		{
			info = new HashMap<String, Object>();
			return info;
		}
		else 
		{
			String xmlData = info.get("CONTENT").toString();
			Map<String, Object> xmlInfo = CommonUtil.getInstance().parseXML(xmlData);
			return xmlInfo;
		}
	}

	/**
	 * ���� �������� ��ȸ�Ѵ�.
	 * 
	 */
	@Override
	public List<Map<String, Object>> selectRateToday(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectRcvRateToday(commandMap);
	}
	
	/**
	 * ������ �������� ��ȸ�Ѵ�.
	 * 
	 */
	@Override
	public List<Map<String, Object>> selectRateYesterDay(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectRcvRateYesterDay(commandMap);
	}
}