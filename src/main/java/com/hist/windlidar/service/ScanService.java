package com.hist.windlidar.service;

import java.util.List;
import java.util.Map;

public interface ScanService {
	List<Map<String, Object>> selectScanParameterList(Map<String, Object> commandMap)  throws Exception;
	int selectScanCount(Map<String, Object> commandMap)  throws Exception;
}
