package com.hist.windlidar.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hist.windlidar.dao.MemberDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public List<Map<String, Object>> selectMemberList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberList(commandMap);
	}

	@Override
	public void insertMember(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		memberDAO.insertMember(commandMap);
	}

	/**
	 * Controller클래스로부터 넘어온 파라미터를 가지고 DAO 클래스에 넘겨준다.
	 * 
	 */
	@Override
	public Map<String, Object> selectMemberDefailtInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberDetail(commandMap);
	}

	/**
	 *  사용자 정보를 업데이트 한다. 
	 */
	@Override
	public void updateMember(Map<String, Object> commandMap) throws Exception {
		log.info("updateMember called : " + commandMap.get("IDX"));
		// TODO Auto-generated method stub
		memberDAO.updateMember(commandMap);
	}

	/**
	 * 사용자 정보를 삭제한다.
	 */
	@Override
	public void deleteMember(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		log.info("deleteMember [User delete] : " + commandMap.get("IDX"));
		memberDAO.deleteMember(commandMap);
		
	}

}
