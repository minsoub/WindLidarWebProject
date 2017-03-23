package com.hist.windlidar.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO  extends AbstractDAO {
	
	/**
	 * Map���� �Ѿ�� ����� ������ ������ �����ͺ��̽��� ����Ѵ�.
	 * ������ : insertMember ���� ����
	 * 
	 * @param map
	 * @throws Exception
	 */
	public void insertMember(Map<String, Object> map) throws Exception
	{
		insert("windlidar.insertMember", map);
	}
	
	/**
	 * ����� ����Ʈ�� ��ȸ�ؼ� Map �� ��Ƽ� �����Ѵ�.
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception
	{
		return (List<Map<String, Object>>) selectList("windlidar.selectMemberList", map);
	}
	
	/**
	 * ������� �� ������ ��ȸ�Ѵ�.
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberDetail(Map<String, Object> map) throws Exception
	{
		return (Map<String, Object>)selectOne("windlidar.selectMemberDetail", map);
	}
	
	/**
	 * ����� ������ ������Ʈ �Ѵ�.
	 * Key id : IDX
	 * ���������� �Ѿ�� �Ķ���� ������ ���ؼ� ��ҹ��ڸ� �����Ѵ�.
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public void updateMember(Map<String, Object> map) throws Exception
	{
		update("windlidar.updateMember", map);
	}
	
	/**
	 * ����� ������ �����Ѵ�.
	 * Key ID : IDX
	 * JSP ������ �Ѿ�� �Ķ���� ������ ���ؼ� ��ҹ��� �����Ѵ�.
	 * 
	 * @param map
	 * @throws Exception
	 */
	public void deleteMember(Map<String, Object> map) throws Exception
	{
		delete("windlidar.deleteMember", map);
	}
}
