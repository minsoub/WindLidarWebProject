package com.hist.windlidar.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class CommonUtil {
	
	private static CommonUtil single = new CommonUtil();
    
	public static CommonUtil getInstance(){
	        
		return single;
	    
	}
	
	/**
	 * ������ ��¥�� �����Ѵ�.
	 * ���� ������ yyyy-MM-dd �������� �����Ѵ�.
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
	 * ���ڸ� �Է¹޾Ƽ� 2�ڸ��� ���ڿ��� ��ȯ�ؼ� �����Ѵ�.
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
