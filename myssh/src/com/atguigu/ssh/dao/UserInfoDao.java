package com.atguigu.ssh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.atguigu.ssh.domain.Userinfo;
import com.atguigu.ssh.utils.MD5Utils;

@Repository("userInfoDao")
public class UserInfoDao {
	
	@Resource(name="hibernateTemplate") // javax 标签,默认基于名称注入,通过name指定
	private HibernateTemplate hinernateTemplate; // 注入方式获取hibernate操作数据库支持,避免继承HibernateDaoSupport,带来的污染
	
	public Userinfo getByNameAndPwd(Userinfo userInfo){
		/* 1.hql 语句查询时,fetch="join" 连表查询失效,为避免fatch="select" 批次抓取带来的延迟加载问题,在hbm.xml中强制设置lazy=false
		 * 2.hql 语句基于pojo 操作数据库时,即使未找到指定对象,也会返回一个空集合
		 */
		String hql = "from Userinfo where name=? and password = ?";
		List<Userinfo> userList = hinernateTemplate.find(hql, userInfo.getName(),
				MD5Utils.md5(userInfo.getPassword()));
		return userList.size()==0?null:userList.get(0);
	}
	
}
