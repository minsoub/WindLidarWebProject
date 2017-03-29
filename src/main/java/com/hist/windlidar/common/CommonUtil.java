package com.hist.windlidar.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class CommonUtil {
	
	private static CommonUtil single = new CommonUtil();
    
	public static CommonUtil getInstance(){
	        
		return single;
	    
	}
	
	/**
	 * 현재의 날짜를 리턴한다.
	 * 리턴 형식은 yyyy-MM-dd 형식으로 리턴한다.
	 * 
	 * example) SimpleDateFormat("yyyy-MM-dd_HHmmss")
	 * 
	 * @return
	 */
	public String getCurrentDate()
	{
		String dt = null;
		
		dt = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		
		return dt;
	}
	
	/**
	 * 숫자를 입력받아서 2자리수 문자열로 변환해서 리턴한다.
	 * 
	 * @param idx
	 * @return
	 */
	public String getNumericChar(int idx)
	{
		if (idx < 10)
		{
			return "0"+String.valueOf(idx);
		}
		else {
			return String.valueOf(idx);
		}
	}
}
