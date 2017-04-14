package com.hist.windlidar.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public final class DateFunCls {
	
	private DateFunCls() {}
	 
	public static boolean daysBetween(Date before, Date after) {
	    Calendar c1 = createCalendarWithoutTime(before);
	    Calendar c2 = createCalendarWithoutTime(after);
	    
	    Date d1 = c1.getTime();
	    Date d2 = c2.getTime();
	    
	    long diff = d2.getTime() - d1.getTime();
	    
	    long diffMinutes = diff;   //  / (60 * 1000) % 60;		// minute
	    
	    if (diffMinutes < 0 )		// 비교날짜가 더 작으면 
	        return false;
	    else
	    	return true;
	}

	public static boolean daysUntilToday(String date1) {
		// yyyy-MM-dd HH:mi
		try
		{
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			Date to = transFormat.parse(date1+":00");

			return daysBetween(to, new Date());
		}catch( ParseException ex)
		{
			System.out.println(ex.toString());
			return false;
		}
	}

	private static Calendar createCalendarWithoutTime(Date date) {
	    Calendar calendar = Calendar.getInstance();
	    calendar.setTime(date);
	    //calendar.set(Calendar.HOUR_OF_DAY, 0);
	    //calendar.set(Calendar.MINUTE, 0);
	    calendar.set(Calendar.SECOND, 0);
	    calendar.set(Calendar.MILLISECOND, 0);
	    return calendar;
	}
}
