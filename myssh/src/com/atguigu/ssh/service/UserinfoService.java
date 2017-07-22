package com.atguigu.ssh.service;

import com.atguigu.ssh.domain.Userinfo;

public interface UserinfoService {

	Userinfo getByNameAndPwd(Userinfo userInfo);
	
}
