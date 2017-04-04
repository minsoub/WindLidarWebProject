package com.hist.windlidar.common;

public class SessionClass {
	private String id;
	private String name;
	private int auth;
	private String loginDt;
	
	public SessionClass()
	{
		
	}
	
	public String getId() 
	{
		return id;
	}
	public String getName()
	{
		return name;
	}
	
	public void setId(String _id)
	{
		id = _id;
	}
	public void setName(String _name)
	{
		name = _name;
	}
	public int getAuth()
	{
		return auth;
	}
	public void setAuth(int _auth)
	{
		auth = _auth;
	}
	
	public void setLoginDt(String _dt)
	{
		loginDt = _dt;
	}
	
	public String getLoginDt()
	{
		return loginDt;
	}
	
}
