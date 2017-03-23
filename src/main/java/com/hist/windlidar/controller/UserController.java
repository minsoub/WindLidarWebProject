package com.hist.windlidar.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hist.windlidar.common.CommandMap;
import com.hist.windlidar.service.MemberService;

@Controller
public class UserController {
	Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	/**
	 * ����� ��� �������� �̵��Ѵ�
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/userRegister.do")
	public ModelAndView userRegister(CommandMap commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView("/user/userRegister");
		
		return mv;
	} 
	
	@RequestMapping(value="/memberInsert.do")
	public ModelAndView memberInsert(CommandMap commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView("redirect:/memberList.do");
		
		//Map<String, Object> map = commandMap.getMap();
		//System.out.println("data : " + map.toString());
		
		 
		memberService.insertMember(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/memberList.do")
	public ModelAndView memberList(CommandMap commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView("/user/userList");
		List<Map<String, Object>> list = memberService.selectMemberList(commandMap.getMap());
		
		// ����� Ŭ���̾�Ʈ�� ����
		mv.addObject("list", list);
		return mv;
	}
	
	/**
	 * ����� �� ������ ��ȸ�Ѵ�.
	 * ȣ�� �������κ��� ����� ���̵�� IDX ������ �Ѿ� �Դ�.
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/userDetailInfo.do")
	public ModelAndView memberDetailInfo(CommandMap commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView("/user/userRegister");
		Map<String, Object> detailInfo = memberService.selectMemberDefailtInfo(commandMap.getMap());
		
		mv.addObject("info", detailInfo);
		return mv;
	}
	
	/**
	 * ����� ������ ������Ʈ �Ѵ�.
	 * �Ķ���Ϳ��� IDX�� Hidden Key�� �Ѿ�´�. 
	 * IDX�� Key�� �����ͺ��̽����� ������Ʈ�� ������ �� �ֵ��� �Ѵ�.
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/memberUpdate.do")
	public ModelAndView memberUpdate(CommandMap commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView("redirect:/memberList.do");
	
		log.info("memberUpdate.do called : " + commandMap.getMap().get("IDX"));
		memberService.updateMember(commandMap.getMap());
		
		return mv; 		
	}
	
	/**
	 * ����� ������ �����Ѵ�.
	 * �Ķ���Ϳ��� IDX�� Hidden���� Key�� �Ѿ�´�.
	 * HTML�±׿��� name �ʵ忡 ��ϵ� �̸����� ���εȴ�.
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception  
	 */
	@RequestMapping(value="/memberDelete.do")
	public ModelAndView memberDelete(CommandMap commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView("redirect:/memberList.do");
		log.info("memberDelete.do called : " + commandMap.getMap().get("IDX"));		 
		memberService.deleteMember(commandMap.getMap());
		
		return mv;
	}
}
