package com.hist.windlidar.service;

import java.util.Map;

public interface LoginService {
	Map<String, Object> selectLoginInfo(Map<String, Object> commandMap) throws Exception;
}
