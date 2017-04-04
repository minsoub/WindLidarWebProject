package com.hist.windlidar.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.hist.windlidar.common.CommandMap;
import com.hist.windlidar.common.SessionClass;
import com.hist.windlidar.service.LoginService;

@Controller
public class LoginController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private HttpSession session;	
	
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
	public ModelAndView loginProcess(CommandMap commandMap) throws Exception
	{
		ModelAndView mv = null;
		
		log.info("userLogin start....");
		Map<String, Object> loginInfo = loginService.selectLoginInfo(commandMap.getMap());
		
		if (loginInfo != null)
		{
			log.info("session regisgter...");
			SessionClass cls = new SessionClass();
			cls.setId(loginInfo.get("ID").toString());
			cls.setName(loginInfo.get("NAME").toString());
			cls.setLoginDt(loginInfo.get("LAST_DT").toString());
			int auth_chk = Integer.parseInt(loginInfo.get("AUTH_CHK").toString());
			cls.setAuth(auth_chk);
			session.setAttribute("user", cls);
			
			// ����� ���� �ð� ������Ʈ
			boolean result = loginService.updateLoginInfo(loginInfo.get("ID").toString());
			
			if (result == false)
			{
				RedirectView redirectView = new RedirectView("userDetailInfo.do");
				redirectView.setContextRelative(true);
				commandMap.put("msg", "����� ���ӽð��� ������Ʈ �ϴµ� ������ �߻��Ͽ����ϴ�. �����ڿ��� �������ֽñ� �ٶ��ϴ�!!!");
				mv = new ModelAndView(redirectView, commandMap.getMap());
			}
			else 
			{
				mv = new ModelAndView("redirect:/login.do");
			}
		}
		else
		{
			RedirectView redirectView = new RedirectView("userDetailInfo.do");
			redirectView.setContextRelative(true);
			commandMap.put("msg", "����� ������ �������� �ʽ��ϴ�!!!");
			mv = new ModelAndView(redirectView, commandMap.getMap());
		}
		
		return mv; 
	}
	
	/**
	 * �α��� ���� üũ �ϴ� �޼ҵ�
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login.do") 
	public ModelAndView loginProcessCheck(CommandMap commandMap) throws Exception 
	{
		ModelAndView mv = null;
		if (session.getAttribute("user") == null) 
		{
			log.info("User login fail");
			mv = new ModelAndView("/loginForm");
			if (commandMap.get("msg") != null)
			{
				mv.addObject("commandMap", commandMap.getMap());
			}
			return mv;
		}else {
			log.info("User login ok");
			log.info("msg : " + commandMap.get("msg"));
			
			commandMap.put("msg", commandMap.get("msg"));
			mv = new ModelAndView("redirect:/main.do");
			
			if (commandMap.get("msg") != null)
			{
				mv.addObject("commandMap", commandMap.getMap());
			}
			
			return mv;
		}
	}
	
	/**
	 * ����ڰ� �α׾ƿ� ��ư�� Ŭ������ �� ȣ��Ǵ�  Controller �޼ҵ�
	 * HttpSession�� invalidate �޼ҵ带 ȣ���ؼ� ������ �����Ѵ�.
	 * ������ ������ home.jsp �� �̵��Ѵ�.
	 * 
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/logout.do")
	public ModelAndView logout() throws Exception
	{
		// session invalidate
		ModelAndView mv = new ModelAndView("/loginForm");
		session.setAttribute("user", null);
		session.invalidate();
		
		CommandMap commandMap = new CommandMap();
		commandMap.put("msg", "�α׾ƿ� �Ǿ����ϴ�!");
		
		mv.addObject("commandMap", commandMap.getMap()); 
		
		log.info("msg : " + commandMap.get("msg"));
		
		return mv;
	}
}
