package com.atguigu.ssh.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.atguigu.ssh.domain.Userinfo;
import com.atguigu.ssh.service.UserinfoService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("loginAction")@Scope("prototype") // 局部注解,ioc管理action,且为原型模式,struts.xml中配置结果集
public class LoginAction extends ActionSupport implements ModelDriven<Userinfo> {
	private static final long serialVersionUID = 5165488760029381702L;

	private Userinfo userInfo = new Userinfo();
	@Autowired
	private UserinfoService userInfoService;

	@Override
	public Userinfo getModel() {
		return userInfo;
	}
	
	public String login() {
		Userinfo queryUser = userInfoService.getByNameAndPwd(userInfo);
		return queryUser == null ? "fail" : "success";
	}

	public void setUserInfoService(UserinfoService userInfoService) {
		this.userInfoService = userInfoService;
	}
	
}
