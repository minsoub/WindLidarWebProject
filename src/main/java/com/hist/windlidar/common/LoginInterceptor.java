package com.hist.windlidar.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private HttpSession session;	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		log.info(request.getRequestURI());
		if (!request.getRequestURI().equals("/windlidar/userLogin.do") && !request.getRequestURI().equals("/windlidar/login.do"))
		{
			if (SessionCheck.getInstance().isSession(session) == false)
			{
				response.sendRedirect("/windlidar/login.do");
				return false;
			}
			else {
				return true; 
			} 
		}
		
		//return super.preHandle(request, response, handler);
		return true;
	}

}
