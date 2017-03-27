package com.hist.windlidar.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hist.windlidar.common.CommandMap;
import com.hist.windlidar.service.ScanService;

@Controller
public class ScanController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="scanService")
	private ScanService scanService;
	
	/**
	 * Scanning Parameter 리스트 화면 호출
	 * 데이터를 List를 받아와서 화면에 'list'로 넘겨준다.
	 * 조회개수가 많으므로 페이징을 고려한다.
	 * scanlist.jsp
	 * @param commandMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/scanList.do")
	public ModelAndView memberList(CommandMap commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView("/scan/scanlist");
		
		if (commandMap.get("s_code") == null)
		{
			commandMap.put("s_code", 13211);
		}
		// 초기화
		commandMap.put("start", false);
		commandMap.put("end", false);
		
		int count = 0;
		commandMap.setPage(commandMap.getPage());
		
		count = scanService.selectScanCount(commandMap.getMap()); 
		commandMap.setCount(count); 
		
		log.info("page : " + commandMap.getPage());
		log.info("prev : " + commandMap.get("prev"));
		log.info("next : " + commandMap.get("next"));
		log.info("count : " + commandMap.get("count")); 
		log.info("start : " + commandMap.get("start"));
		log.info("end : " + commandMap.get("end"));
		
		if (commandMap.get("start") == null) commandMap.put("start", 0);
		commandMap.put("listNum", (Integer.parseInt(commandMap.get("page").toString()) - 1) * 10);
		
		List<Map<String, Object>> list = scanService.selectScanParameterList(commandMap.getMap());
		
		// 결과를 클라이언트에 전달
		mv.addObject("list", list);
		mv.addObject("commandMap", commandMap.getMap()); 
		
		return mv;
	}
}
