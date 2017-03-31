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
	 * 현재의 년월를 리턴한다.
	 * 리턴 형식은 yyyy-MM 형식으로 리턴한다.
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
	 * 주어진 포멧 형식으로 금일 날짜를 리턴한다.
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
	 * 주어진 년-월의 미자막 일자를 구해서 리턴한다.
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
