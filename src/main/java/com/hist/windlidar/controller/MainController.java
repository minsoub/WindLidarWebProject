package com.hist.windlidar.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.codehaus.jackson.map.ObjectMapper;

import com.hist.windlidar.common.CommandMap;
import com.hist.windlidar.common.CommonUtil;
import com.hist.windlidar.service.MainService;

@Controller
public class MainController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mainService")
	private MainService mainService;
	
	
	/**
	 * 메인 화면에 출력될 데이터를 조회한다.
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/main.do")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView("/main");
		
		commandMap.put("s_code", "13211");
		Map<String, Object> paramInfo01 = mainService.selectParamInfo(commandMap.getMap());
		Map<String, Object> alarmInfo01 = mainService.selectAlaramInfo(commandMap.getMap());
		
		
		commandMap.put("s_code", "13210");
		Map<String, Object> paramInfo02 = mainService.selectParamInfo(commandMap.getMap());
		Map<String, Object> alarmInfo02 = mainService.selectAlaramInfo(commandMap.getMap());
		
		commandMap.put("s_code", "13206");
		Map<String, Object> paramInfo03 = mainService.selectParamInfo(commandMap.getMap());
		Map<String, Object> alarmInfo03 = mainService.selectAlaramInfo(commandMap.getMap());
		
		
		
		mv.addObject("PAM1", paramInfo01);
		mv.addObject("PAM2", paramInfo02);
		mv.addObject("PAM3", paramInfo03);
		
		mv.addObject("ALM01", alarmInfo01);
		mv.addObject("ALM02", alarmInfo02);
		mv.addObject("ALM03", alarmInfo03);
		
		// today rate
		String todayDt = CommonUtil.getInstance().getCurrentFormat("yyyy-MM-dd");
		commandMap.put("s_date", todayDt);
		List<Map<String, Object>> todayList = mainService.selectRateToday(commandMap.getMap());
		
		// yesterday rate
		String yesDt = CommonUtil.getInstance().getYesaterDay();
		commandMap.put("s_date", yesDt);
		List<Map<String, Object>> yesterDayList = mainService.selectRateYesterDay(commandMap.getMap());
		
		mv.addObject("toList", todayList);
		mv.addObject("yeList", yesterDayList);		

		return mv; 
	}
	
	@RequestMapping(value="/ajax/connSearch", method=RequestMethod.GET)
	public void AjaxViewSearch(@RequestParam("s_code") String s_code, HttpServletResponse response)
	{
		log.info("ajax called...."); 
		ObjectMapper mapper = new ObjectMapper();
		CommandMap commandMap = new CommandMap();
		commandMap.put("s_code", "13211");
		
		try {
			Map<String, Object> paramInfo01;
			paramInfo01 = mainService.selectParamInfo(commandMap.getMap());
			
			response.getWriter().print(mapper.writeValueAsString(paramInfo01));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}
