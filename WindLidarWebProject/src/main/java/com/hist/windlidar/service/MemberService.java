package com.hist.windlidar.service;

import java.util.List;
import java.util.Map;

public interface MemberService {
	List<Map<String, Object>> selectMemberList(Map<String, Object> commandMap)  throws Exception;
	void insertMember(Map<String, Object> map) throws Exception;
	Map<String, Object> selectMemberDefailtInfo(Map<String, Object> commandMap) throws Exception;
	void updateMember(Map<String, Object> map) throws Exception;
	void deleteMember(Map<String, Object> map) throws Exception;
}
