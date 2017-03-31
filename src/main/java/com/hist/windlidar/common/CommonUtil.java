package com.hist.windlidar.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
	 * ������ ����� �����Ѵ�.
	 * ���� ������ yyyy-MM �������� �����Ѵ�.
	 * 
	 * example) SimpleDateFormat("yyyy-MM")
	 * 
	 * @return
	 */
	public String getCurrentMonth()
	{
		String dt = null;
		
		dt = new SimpleDateFormat("yyyy-MM").format(Calendar.getInstance().getTime());
		
		return dt;
	}
	
	/**
	 * �־��� ���� �������� ���� ��¥�� �����Ѵ�.
	 * 
	 * @param fmt
	 * @return
	 */
	public String getCurrentFormat(String fmt)
	{
		String dt = null;
		
		dt = new SimpleDateFormat(fmt).format(Calendar.getInstance().getTime());
		
		return dt;
	}
	
	/**
	 * �־��� ��-���� ���ڸ� ���ڸ� ���ؼ� �����Ѵ�.
	 * 
	 * @param dtm
	 * @return
	 * @throws ParseException
	 */
	public int getLastDay(String dtm) throws ParseException
	{
		Calendar cal = Calendar.getInstance();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date to = transFormat.parse(dtm+"-01");

		cal.setTime(to);
		
		int last_day = cal.getMaximum(Calendar.DAY_OF_MONTH);
		
		
		return last_day;		
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
