package com.hist.windlidar.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {
	
	
	/**
	 * ����� ���̵�� �н����带 �Ķ���ͷ� �޾ƿͼ� �α��� ������ ��ȸ�Ѵ�.
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
	 * ����� ���̵�� ����� ���� ���ӽð��� ������Ʈ �Ѵ�.
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
