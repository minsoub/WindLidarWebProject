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
	
	
}
