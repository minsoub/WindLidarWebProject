package com.hist.windlidar.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hist.windlidar.common.CommandMap;
import com.hist.windlidar.common.SessionClass;
import com.hist.windlidar.service.LoginService;

@Controller
public class LoginController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	/**
	 * ����� ���̵�� �н����带 �Ķ���ͷ� �޾Ƽ� ����� �α��� ������ ��ȸ�Ѵ�.
	 * ��ȸ�� ������ ����� ������ ����Ѵ�.
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/userLogin.do")
	public ModelAndView userLogin(HttpSession session, CommandMap commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView("redirect:/login.do");
		
		log.info("userLogin start....");
		Map<String, Object> loginInfo = loginService.selectLoginInfo(commandMap.getMap());
		
		if (loginInfo != null)
		{
			log.info("session regisgter...");
			SessionClass cls = new SessionClass();
			cls.setId(loginInfo.get("ID").toString());
			cls.setName(loginInfo.get("NAME").toString());
			int auth_chk = Integer.parseInt(loginInfo.get("AUTH_CHK").toString());
			cls.setAuth(auth_chk);
			
			session.setAttribute("user", cls);
		}
		
		return mv; 
	}
	
	@RequestMapping(value="/login.do") 
	public ModelAndView loginCheck(HttpSession session) throws Exception 
	{
		if (session.getAttribute("user") == null) 
		{
			log.info("User login fail");
			return new ModelAndView("/home");
		}else {
			log.info("User login ok");
			return new ModelAndView("/main"); 
		}
	}
}
