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
	 * 시간대별 관측자료 수신 통계를 조회한다.
	 * 통계 데이터이므로 24시간 데이터 조회를 위해서 24번 조회가 필요
	 * 
	 */
	@Override
	public List<Map<String, Object>> windLidarListPerHourSearch(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, Object>> dataList = new ArrayList<Map<String, Object>>();
		
		
		for (int i=0; i<24; i++)
		{
			// 시간대별 24번을 조회한다.
			String hour = CommonUtil.getInstance().getNumericChar(i);
			String from = CommonUtil.getInstance().getNumericChar(i+1);
			commandMap.put("HOURTOFROM", hour + "~"+from);
			commandMap.put("HOUR", hour);			// 시간대별 파라미터
			
			commandMap.put("S_DT", commandMap.get("s_date").toString() + " "+hour);
			//log.info("S_DT : " + commandMap.get("S_DT"));
			
			Map<String, Object> info = windLidarDAO.selectWindLidarPerHour(commandMap);
			
			dataList.add(info);		
		}
		
		return dataList;
	}

}
