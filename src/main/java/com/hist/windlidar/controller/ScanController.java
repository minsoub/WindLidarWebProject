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
	 * Scanning Parameter ����Ʈ ȭ�� ȣ��
	 * �����͸� List�� �޾ƿͼ� ȭ�鿡 'list'�� �Ѱ��ش�.
	 * ��ȸ������ �����Ƿ� ����¡�� ����Ѵ�.
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
		// �ʱ�ȭ
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
		
		// ����� Ŭ���̾�Ʈ�� ����
		mv.addObject("list", list);
		mv.addObject("commandMap", commandMap.getMap()); 
		
		return mv;
	}
}
