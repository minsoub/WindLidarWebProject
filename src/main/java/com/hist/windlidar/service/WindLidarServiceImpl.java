package com.hist.windlidar.service;

import java.text.DecimalFormat;
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
	 * 통계 데이터이므로 24시간 데이터 조회
	 * 
	 */
	@Override
	public List<Map<String, Object>> windLidarListPerHourSearch(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, Object>> dataList =  windLidarDAO.selectWindLidarPerHour(commandMap);
		
		return dataList;
	}

	/**
	 * 일자별 관측자료 수신 통계를 조회한다.
	 * 
	 */
	@Override
	public List<Map<String, Object>> windLidarListPerDaySearch(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, Object>> dataList =  windLidarDAO.selectWindLidarPerDay(commandMap);
		List<Map<String, Object>> makeList = new ArrayList<Map<String, Object>>();
		// 데이터 가공
		//  ST_DAY       H_TIME   RATE
		//  2017-03-10   08       16.07
		//  2017-03-10   09       32.46
		//  2017-03-10   10       100.00
		
		int last_day = CommonUtil.getInstance().getLastDay(commandMap.get("s_date").toString());

		
		for (int i=1; i<=last_day; i++)
		{
			String startDay = CommonUtil.getInstance().getNumericChar(i);
			String searchDay = commandMap.get("s_date").toString()+"-"+startDay;
			double avg = 0.0;
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("ST_DAY", startDay);
			int dayFound = 0;
			for (int j=0; j<=23; j++)
			{
				String hTime = CommonUtil.getInstance().getNumericChar(j);

				int found = 0;
				for(Map<String, Object> item : dataList)
				{
				    //log.info("startDay : " + startDay + ", h_time : " + hTime+", found data : " + item.get("ST_DAY") + ", H_TIME : " + item.get("H_TIME") + ", Rate : " + item.get("RATE"));
					if (searchDay.equals(item.get("ST_DAY").toString()) && item.get("H_TIME").toString().equals(hTime))
					{
						//log.info("found data : " + item.get("ST_DAY") + ", H_TIME : " + item.get("H_TIME") + ", Rate : " + item.get("RATE"));
						found = 1;
						dayFound = 1;
						data.put("H_TIME"+hTime, item.get("RATE").toString());
						avg += Double.parseDouble(item.get("RATE").toString());
						
						break;
					}
				}
				if (found == 0)
				{
					data.put("H_TIME"+hTime, "0");
				}
			}
			
			if (dayFound == 0)
			{
				for (int j=0; j<=23; j++)
				{
					String hTime = CommonUtil.getInstance().getNumericChar(j);
					data.put("H_TIME"+hTime, "0");
				}
				data.put("AVG", "0.00");
				makeList.add(data);	
			}else {
				avg = avg/24;
				DecimalFormat format = new DecimalFormat(".##");
                String str = format.format(avg);


				data.put("AVG", str);
				makeList.add(data);	
			}
		}
		
		return makeList;
	}
	
	/**
     * 월별 관측자료를 리턴한다.
     */
	@Override
	public List<Map<String, Object>> windLidarListPerMonSearch(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, Object>> dataList =  windLidarDAO.selectWindLidarPerMon(commandMap);

		
		return dataList;
	}

}
