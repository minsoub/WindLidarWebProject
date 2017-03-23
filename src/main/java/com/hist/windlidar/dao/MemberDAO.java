package com.hist.windlidar.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO  extends AbstractDAO {
	
	/**
	 * Map에서 넘어온 사용자 정보를 가지고 데이터베이스에 등록한다.
	 * 쿼리문 : insertMember 쿼리 참조
	 * 
	 * @param map
	 * @throws Exception
	 */
	public void insertMember(Map<String, Object> map) throws Exception
	{
		insert("windlidar.insertMember", map);
	}
	
	/**
	 * 사용자 리스트를 조회해서 Map 에 담아서 리턴한다.
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
	 * 사용자의 상세 정보를 조회한다.
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
	 * 사용자 정볼르 업데이트 한다.
	 * Key id : IDX
	 * 수정폼에서 넘어온 파라미터 변수에 대해서 대소문자를 주의한다.
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
	 * 사용자 정볼를 삭제한다.
	 * Key ID : IDX
	 * JSP 폼에서 넘어온 파라미터 변수에 대해서 대소문자 주의한다.
	 * 
	 * @param map
	 * @throws Exception
	 */
	public void deleteMember(Map<String, Object> map) throws Exception
	{
		delete("windlidar.deleteMember", map);
	}
}
