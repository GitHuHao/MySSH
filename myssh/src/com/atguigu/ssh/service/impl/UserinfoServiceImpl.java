package com.atguigu.ssh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atguigu.ssh.dao.UserInfoDao;
import com.atguigu.ssh.domain.Userinfo;
import com.atguigu.ssh.service.UserinfoService;
@Service("UserinfoService")
public class UserinfoServiceImpl implements UserinfoService {
	@Autowired
	private UserInfoDao userInfoDao;
	
	@Transactional(readOnly=true)
	public Userinfo getByNameAndPwd(Userinfo userInfo) {
		return userInfoDao.getByNameAndPwd(userInfo);
	}

}
