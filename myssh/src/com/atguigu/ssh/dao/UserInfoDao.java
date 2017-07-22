package com.atguigu.ssh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.atguigu.ssh.domain.Userinfo;
import com.atguigu.ssh.utils.MD5Utils;

@Repository("userInfoDao")
public class UserInfoDao {
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hinernateTemplate;
	
	public Userinfo getByNameAndPwd(Userinfo userInfo){
		String hql = "from Userinfo where name=? and password = ?";
		List<Userinfo> userList = hinernateTemplate.find(hql, userInfo.getName(),MD5Utils.md5(userInfo.getPassword()));
		return userList.size()==0?null:userList.get(0);
	}
	
}
