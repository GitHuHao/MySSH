package com.atguigu.ssh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atguigu.ssh.dao.UserInfoDao;
import com.atguigu.ssh.domain.Userinfo;
import com.atguigu.ssh.service.UserinfoService;
@Service("userInfoService")
public class UserinfoServiceImpl implements UserinfoService {
	
	@Autowired@Qualifier("userInfoDao") // spring 标签,默认基于类型注入,存在多个bean时,依据@Qualifier指定
	private UserInfoDao userInfoDao;
	
	@Transactional(readOnly=true) // 注解驱动开启事务,使用只读模式能够体改并发率
	public Userinfo getByNameAndPwd(Userinfo userInfo) {
		return userInfoDao.getByNameAndPwd(userInfo);
	}

}
