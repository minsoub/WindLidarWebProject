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
	 * 사용자 로그인 정보를 조회해서 Map에 담아서 리턴한다.
	 */
	@Override
	public Map<String, Object> selectLoginInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.selectLoginInfo(commandMap);
	}

}
