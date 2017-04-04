package com.hist.windlidar.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hist.windlidar.common.CommandMap;
import com.hist.windlidar.common.CommonUtil;
import com.hist.windlidar.service.WindLidarService;

@Controller
public class WindLidarController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="windLidarService")
	private WindLidarService windLidarService;
	
	// 아래 URL 호출은 다음과 같이 호출되어야 한다.
	// http://localhost:8080/windlidar/windlidar/windLidarList.do
	@RequestMapping(value="/windlidar/windLidarList.do")
	public ModelAndView openWindLidarList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/windLidar/windLidarList");		// JSP File
		
		List<Map<String, Object>> list = windLidarService.selectWindLidarList(commandMap);
		
		// 결과를 클라이언트에 전달
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping(value="/windlidar/testMapArgumentResolver.do")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView("/windLidar/testMapArgumentResolver");
		
		log.debug("ModelAndView called............");
		if (commandMap.isEmpty() == false)
		{
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext())
			{
				entry = iterator.next();
				log.debug("key : " + entry.getKey()+", value : " + entry.getValue());
			}			
		}
		return mv; 
	}
	 
	/**
	 * 시간대별 관측자료 수신 통계 조회 Controller 메소드
	 * 검색 조건 : 파라미터, 일자별  검색
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/windLidarHList.do")
	public ModelAndView windLidarListPerHour(CommandMap commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView("/data/dataHourList");
		
		if (commandMap.get("s_code") == null)
		{
			commandMap.put("s_code", 13211);
		}
		if (commandMap.get("s_date") == null)
		{
			commandMap.put("s_date", CommonUtil.getInstance().getCurrentDate());  // 금일 날짜
		}
		log.info("s_code : " + commandMap.get("s_code"));
		log.info("s_date : " + commandMap.get("s_date"));
		List<Map<String, Object>> list = windLidarService.windLidarListPerHourSearch(commandMap.getMap());
		
		// 결과를 클라이언트에 전달
		mv.addObject("list", list);
		mv.addObject("commandMap", commandMap.getMap()); 
		
		
		return mv;
	}
	
	/**
	 * 일변 관측자료 수신 통계 데이터 조회
	 * 검색조건 : 관측소별, 일자별(년-월)
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/windLidarDList.do")
	public ModelAndView windLidarListPerDay(CommandMap commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView("/data/dataDayList");
		String s_date = null;
		
		if (commandMap.get("s_code") == null)
		{
			commandMap.put("s_code", 13211);
		}
		if (commandMap.get("s_year") == null)
		{
			s_date = CommonUtil.getInstance().getCurrentFormat("yyyy");
		}else {
			s_date = commandMap.get("s_year").toString();
		}
		if (commandMap.get("s_mon") == null)
		{
			s_date += "-"+CommonUtil.getInstance().getCurrentFormat("mm");
		}
		else {
			s_date += "-"+commandMap.get("s_mon").toString();
		}
		commandMap.put("s_date", s_date);
		log.info("s_code : " + commandMap.get("s_code"));
		log.info("s_date : " + commandMap.get("s_date"));
		List<Map<String, Object>> list = windLidarService.windLidarListPerDaySearch(commandMap.getMap());
		
		// 결과를 클라이언트에 전달
		mv.addObject("list", list);
		mv.addObject("commandMap", commandMap.getMap()); 
		
		
		return mv;
	}
	
	/**
	 * 월별 관측자료 수신 통계 데이터 조회
	 * 검색 조건 : 관측소별(옵션), 일자별(년)
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/windLidarMList.do")
	public ModelAndView windLidarListPerMon(CommandMap commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView("/data/dataMonList");
		
		if (commandMap.get("s_date") == null)
		{
			commandMap.put("s_date", CommonUtil.getInstance().getCurrentFormat("yyyy"));
		}
		log.info("s_code : " + commandMap.get("s_code"));
		log.info("s_date : " + commandMap.get("s_date"));
		List<Map<String, Object>> list = windLidarService.windLidarListPerMonSearch(commandMap.getMap());
		
		// 결과를 클라이언트에 전달
		mv.addObject("list", list);
		mv.addObject("commandMap", commandMap.getMap()); 
		
		return mv;
	}
	
	@RequestMapping(value="/index.do") 
	public ModelAndView index(CommandMap commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView("home");
		
		return mv; 
	}  
	
	
}
