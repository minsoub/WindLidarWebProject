package com.hist.windlidar.dao;

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
}
