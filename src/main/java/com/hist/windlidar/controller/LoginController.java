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
	 * 사용자 아이디와 패스워드를 파라미터로 받아서 사용자 로그인 정보를 조회한다.
	 * 조회된 정보로 사용자 세션을 등록한다.
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
			
			// 사용자 접속 시간 업데이트
			boolean result = loginService.updateLoginInfo(loginInfo.get("ID").toString());
			
			if (result == false)
			{
				RedirectView redirectView = new RedirectView("userDetailInfo.do");
				redirectView.setContextRelative(true);
				commandMap.put("msg", "사용자 접속시간을 업데이트 하는데 에러가 발생하였습니다. 관리자에게 문의해주시기 바랍니다!!!");
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
			commandMap.put("msg", "사용자 정보가 존재하지 않습니다!!!");
			mv = new ModelAndView(redirectView, commandMap.getMap());
		}
		
		return mv; 
	}
	
	/**
	 * 로그인 이후 체크 하는 메소드
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
	 * 사용자가 로그아웃 버튼을 클릭했을 때 호출되는  Controller 메소드
	 * HttpSession의 invalidate 메소드를 호출해서 세션을 삭제한다.
	 * 세션을 제거후 home.jsp 로 이동한다.
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
		commandMap.put("msg", "로그아웃 되었습니다!");
		
		mv.addObject("commandMap", commandMap.getMap()); 
		
		log.info("msg : " + commandMap.get("msg"));
		
		return mv;
	}
}
