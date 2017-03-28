package com.hist.windlidar.common;

import javax.servlet.http.HttpSession;

public class SessionCheck {

	private static SessionCheck single = new SessionCheck();
	    
	public static SessionCheck getInstance(){
	        
		return single;
	    
	}
	
	public String getUserId(HttpSession session)
	{
		SessionClass user = (SessionClass) session.getAttribute("user");
		
		return user.getId();
	}
	   
	public int getUserAuth(HttpSession session)
	{
		SessionClass user = (SessionClass) session.getAttribute("user");
		
		return user.getAuth();
	}
	private SessionCheck(){ }
	    
	/**
	 * 사용자 세션이 존재하는지 체크한다.
	 * 
	 * @param session
	 * @return
	 */
	public boolean isSession(HttpSession session)
	{
		if (session.getAttribute("user") == null)
		{
			return false;
		}
		else 
		{
			return true;
		}
	}
	
	/**
	 * 권한이 관리자 권한인지 확인한다.
	 * 관리자 권한 : 2 (사용자 : 1, 접속차단회원 : 0)
	 * 
	 * @param session
	 * @return
	 */
	public boolean isAuth(HttpSession session)
	{
		if (session.getAttribute("user") == null)
		{
			return false;
		}
		else 
		{
			SessionClass user = (SessionClass) session.getAttribute("user");
			
			if (user.getAuth() == 2)
			{
				return true;
			}
			return false;
		}
	}
}
