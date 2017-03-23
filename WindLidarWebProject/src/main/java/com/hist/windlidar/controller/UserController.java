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
	 * 사용자 등록 페이지로 이동한다
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
		
		// 결과를 클라이언트에 전달
		mv.addObject("list", list);
		return mv;
	}
	
	/**
	 * 사용자 상세 정보를 조회한다.
	 * 호출 페이지로부터 사용자 아이디로 IDX 변수가 넘어 왔다.
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
	 * 사용자 정보를 업데이트 한다.
	 * 파라미터에서 IDX가 Hidden Key로 넘어온다. 
	 * IDX를 Key로 데이터베이스에서 업데이트를 수행할 수 있도록 한다.
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
	 * 사용자 정보를 삭제한다.
	 * 파라미터에서 IDX가 Hidden으로 Key로 넘어온다.
	 * HTML태그에서 name 필드에 등록된 이름으로 맵핑된다.
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
