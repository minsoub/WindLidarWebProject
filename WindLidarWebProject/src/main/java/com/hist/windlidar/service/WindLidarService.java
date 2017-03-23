package com.hist.windlidar.service;

import java.util.List;
import java.util.Map;

public interface WindLidarService {
	List<Map<String, Object>> selectWindLidarList(Map<String, Object> commandMap)  throws Exception;
}
