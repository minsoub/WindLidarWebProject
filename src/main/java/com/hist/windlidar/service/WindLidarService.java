package com.hist.windlidar.service;

import java.util.List;
import java.util.Map;

public interface WindLidarService {
	List<Map<String, Object>> selectWindLidarList(Map<String, Object> commandMap)  throws Exception;
	List<Map<String, Object>> windLidarListPerHourSearch(Map<String, Object>commandMap) throws Exception;
	List<Map<String, Object>> windLidarListPerDaySearch(Map<String, Object>commandMap) throws Exception;
	List<Map<String, Object>> windLidarListPerMonSearch(Map<String, Object>commandMap) throws Exception;
}
