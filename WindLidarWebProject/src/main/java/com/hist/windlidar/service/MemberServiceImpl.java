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
	 * ControllerŬ�����κ��� �Ѿ�� �Ķ���͸� ������ DAO Ŭ������ �Ѱ��ش�.
	 * 
	 */
	@Override
	public Map<String, Object> selectMemberDefailtInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberDetail(commandMap);
	}

	/**
	 *  ����� ������ ������Ʈ �Ѵ�. 
	 */
	@Override
	public void updateMember(Map<String, Object> commandMap) throws Exception {
		log.info("updateMember called : " + commandMap.get("IDX"));
		// TODO Auto-generated method stub
		memberDAO.updateMember(commandMap);
	}

	/**
	 * ����� ������ �����Ѵ�.
	 */
	@Override
	public void deleteMember(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		log.info("deleteMember [User delete] : " + commandMap.get("IDX"));
		memberDAO.deleteMember(commandMap);
		
	}

}
