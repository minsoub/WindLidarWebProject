package com.hist.windlidar.service;

import java.util.List;
import java.util.Map;

public interface MainService {
	Map<String, Object> selectParamInfo(Map<String, Object> commandMap) throws Exception;
	Map<String, Object> selectAlaramInfo(Map<String, Object> commandMap) throws Exception;
	List<Map<String, Object>> selectAlaramDetail(Map<String, Object> commandMap) throws Exception;
	List<Map<String, Object>> selectRateToday(Map<String, Object> commandMap) throws Exception;
	List<Map<String, Object>> selectRateYesterDay(Map<String, Object> commandMap) throws Exception;
}
