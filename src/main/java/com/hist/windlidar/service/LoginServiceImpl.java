package com.hist.windlidar.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hist.windlidar.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	
	/**
	 * ����� �α��� ������ ��ȸ�ؼ� Map�� ��Ƽ� �����Ѵ�.
	 */
	@Override
	public Map<String, Object> selectLoginInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.selectLoginInfo(commandMap);
	}

}
