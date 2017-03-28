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

	/**
	 * ID 정보를 가지고 사용자 최종 접속시간을 업데이트 한다.
	 * 
	 */
	@Override
	public boolean updateLoginInfo(String _id) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.updateLoginInfo(_id);
	}

}
