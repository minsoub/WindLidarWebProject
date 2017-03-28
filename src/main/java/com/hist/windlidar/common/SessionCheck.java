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
	 * ����� ������ �����ϴ��� üũ�Ѵ�.
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
	 * ������ ������ �������� Ȯ���Ѵ�.
	 * ������ ���� : 2 (����� : 1, ��������ȸ�� : 0)
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
