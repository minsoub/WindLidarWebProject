package com.hist.windlidar.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.ServletWebRequest;

import com.hist.windlidar.common.CommandMap;
import com.hist.windlidar.common.SessionCheck;
import com.hist.windlidar.service.MemberService;

@Controller
public class UserController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private HttpSession session;	
	
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
		commandMap.put("Auth", SessionCheck.getInstance().getUserAuth(session));
		mv.addObject("commandMap", commandMap.getMap());
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
	/**
	 * ��� ȸ�� ��ȸ
	 * �޴����� �Ѿ� ���� �� ����� ������ Ȯ���� �� ������ ������ �н����� �������� �Ѿ�� �Ѵ�.
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/memberList.do")
	public ModelAndView memberList(CommandMap commandMap) throws Exception
	{
		ModelAndView mv = null;
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		
		if(SessionCheck.getInstance().isSession(session) == false)
		{
			commandMap.put("msg", "����� ������ �������� �ʽ��ϴ�. �ٽ� �α��� �Ͻñ� �ٶ��ϴ�!!!");
			mv = new ModelAndView("/home");
			mv.addObject("commandMap", commandMap.getMap());
			
			return mv;
		}
		
		// ����� ����Ʈ�� �� �� �ִ� ������ �������� üũ�Ѵ�.
		if(SessionCheck.getInstance().isAuth(session) == false)
		{
//			commandMap.put("msg", "����� ������ �����ϴ�)!!!");
//			
//			String url = request.getHeader("referer");
//			log.info("url : " + url);   // http://localhost:8080/windlidar/login.do
//			
//			String[] arr = url.split("/");
//			String sUrl = arr[arr.length-1];
//			
//			String tUrl = (sUrl.split("?"))[0];
//
//			RedirectView redirectView = new RedirectView(tUrl);
//			redirectView.setContextRelative(true);
//			  
//			mv = new ModelAndView(redirectView, commandMap.getMap());
//			
//			log.info("msg : " + commandMap.get("msg"));
			
			// ����� ���� ���������� �̵�
			commandMap.put("IDX", SessionCheck.getInstance().getUserId(session));
			RedirectView redirectView = new RedirectView("userDetailInfo.do");
			redirectView.setContextRelative(true);
			
			mv = new ModelAndView(redirectView, commandMap.getMap());
			
			return mv;
		}
		else {
			mv = new ModelAndView("/user/userList");
			List<Map<String, Object>> list = memberService.selectMemberList(commandMap.getMap());
			
			// ����� Ŭ���̾�Ʈ�� ����
			mv.addObject("list", list);  
			return mv;
		}
		
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
		
		log.info("get msg : " + commandMap.get("msg"));
		commandMap.put("Auth", SessionCheck.getInstance().getUserAuth(session));
		mv.addObject("commandMap", commandMap.getMap());
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
		ModelAndView mv = null;
	
		log.info("memberUpdate.do called : " + commandMap.getMap().get("IDX"));
		
		memberService.updateMember(commandMap.getMap());
		
		commandMap.put("msg", "����� ������ �����Ͽ����ϴ�!!!");
		
		RedirectView redirectView = new RedirectView("userDetailInfo.do");
		redirectView.setContextRelative(true);;
		
		mv = new ModelAndView(redirectView, commandMap.getMap());
	
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