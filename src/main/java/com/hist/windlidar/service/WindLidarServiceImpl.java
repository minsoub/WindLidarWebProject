package com.hist.windlidar.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hist.windlidar.common.CommonUtil;
import com.hist.windlidar.dao.WindLidarDAO;

@Service("windLidarService")
public class WindLidarServiceImpl implements WindLidarService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="windLidarDAO")
	private WindLidarDAO windLidarDAO;
	
	@Override
	public List<Map<String, Object>> selectWindLidarList(Map<String, Object> commandMap) throws Exception{
		// TODO Auto-generated method stub
		return windLidarDAO.selectWindLidarList(commandMap);
	}

	/**
	 * �ð��뺰 �����ڷ� ���� ��踦 ��ȸ�Ѵ�.
	 * ��� �������̹Ƿ� 24�ð� ������ ��ȸ�� ���ؼ� 24�� ��ȸ�� �ʿ�
	 * 
	 */
	@Override
	public List<Map<String, Object>> windLidarListPerHourSearch(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, Object>> dataList = new ArrayList<Map<String, Object>>();
		
		
		for (int i=0; i<24; i++)
		{
			// �ð��뺰 24���� ��ȸ�Ѵ�.
			String hour = CommonUtil.getInstance().getNumericChar(i);
			String from = CommonUtil.getInstance().getNumericChar(i+1);
			commandMap.put("HOURTOFROM", hour + "~"+from);
			commandMap.put("HOUR", hour);			// �ð��뺰 �Ķ����
			
			commandMap.put("S_DT", commandMap.get("s_date").toString() + " "+hour);
			//log.info("S_DT : " + commandMap.get("S_DT"));
			
			Map<String, Object> info = windLidarDAO.selectWindLidarPerHour(commandMap);
			
			dataList.add(info);		
		}
		
		return dataList;
	}

}
