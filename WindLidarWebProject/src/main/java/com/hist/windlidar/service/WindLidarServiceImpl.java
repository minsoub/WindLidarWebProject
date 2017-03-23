package com.hist.windlidar.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

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

}
