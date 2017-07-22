package com.atguigu.ssh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.atguigu.ssh.domain.Userinfo;
import com.atguigu.ssh.utils.MD5Utils;

public class UserInfoDao extends HibernateDaoSupport{ //继承方式获取hibernate操作数据库支持
	
	public Userinfo getByNameAndPwd(Userinfo userInfo){
		
		String hql = "from Userinfo where name=? and password = ?";
		List<Userinfo> userList = this.getHibernateTemplate().find(hql, userInfo.getName(),
				MD5Utils.md5(userInfo.getPassword()));
		return userList.size()==0?null:userList.get(0);
	}
}
