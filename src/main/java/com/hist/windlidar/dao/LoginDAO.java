package com.hist.windlidar.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {
	
	
	/**
	 * 사용자 아이디와 패스워드를 파라미터로 받아와서 로그인 정보를 조회한다.
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLoginInfo(Map<String, Object> map) throws Exception
	{
		return (Map<String, Object>)selectOne("windlidar.selectMemberLogin", map);
	}
	
	/**
	 * 사용자 아이디로 사용자 최종 접속시간을 업데이트 한다.
	 * 
	 * @param _id
	 * @return
	 * @throws Exception
	 */
	public boolean updateLoginInfo(String _id) throws Exception
	{
		boolean result = false;
		
		HashMap info = new HashMap();
		
		info.put("_id", _id);
		
		int i_result = (Integer)update("windlidar.updateMemberTime", info);
		
		if (i_result <= 0) result = false;
		else result = true;
		
		return result;
	}
}
