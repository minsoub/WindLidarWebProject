package com.hist.windlidar.service;

import java.util.ArrayList;
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
	 * Scanning Parameter 정보를 조회한다. 최신 한개만 조회한다.
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
	 * Alaram정보를 조회한다.
	 * Alaram 정보의 경우 데이터가 XML 데이터로 되어 있으니 이 부분을 파싱해서 키로 맵핑해서 Map에 담는다.
	 * 
	 */
	@Override
	public Map<String, Object> selectAlaramInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> info = mainDAO.selectAlaramInfo(commandMap);
		
		// xml 데이터를 파싱한다.
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
	 * 금일 수신율을 조회한다.
	 * 
	 */
	@Override
	public List<Map<String, Object>> selectRateToday(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectRcvRateToday(commandMap);
	}
	
	/**
	 * 어제의 수신율을 조회한다.
	 * 
	 */
	@Override
	public List<Map<String, Object>> selectRateYesterDay(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectRcvRateYesterDay(commandMap);
	}

	@Override
	public List<Map<String, Object>> selectAlaramDetail(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> info = mainDAO.selectAlaramInfo(commandMap);
		
		// xml 데이터를 파싱한다.
		if (info == null)
		{
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			return list;
		}
		else 
		{
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			String xmlData = info.get("CONTENT").toString();
			Map<String, Object> xmlInfo = CommonUtil.getInstance().parseXML(xmlData);
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("ST_TIME", info.get("ST_TIME").toString());
			data.put("S_NAME",  info.get("S_NAME").toString());
			data.put("S_CODE",  info.get("S_CODE").toString());
			list.add(data);			
			list.add(xmlInfo);
			
			return list;
		}
	}
}
