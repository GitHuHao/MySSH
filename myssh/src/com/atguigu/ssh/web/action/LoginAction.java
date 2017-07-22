package com.atguigu.ssh.web.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.atguigu.ssh.domain.Userinfo;
import com.atguigu.ssh.service.UserinfoService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
public class LoginAction extends ActionSupport implements ModelDriven<Userinfo> {
	private static final long serialVersionUID = 5165488760029381702L;

	private Userinfo userInfo = new Userinfo();

	// @Autowired
	// private UserinfoService userInfoService;

	@Override
	public Userinfo getModel() {
		return userInfo;
	}
	
	public String execute() {
		Userinfo queryUser = null;
		// queryUser = userInfoService.getByNameAndPwd(userInfo);
		return queryUser == null ? "fail" : "success";
	}

}
