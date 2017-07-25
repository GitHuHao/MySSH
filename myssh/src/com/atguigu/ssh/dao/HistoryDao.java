package com.atguigu.ssh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.atguigu.ssh.domain.Goods;
import com.atguigu.ssh.domain.History;

@Repository("hisDao")
public class HistoryDao {

	@Resource
	private HibernateTemplate hibernateTemplate;
	
	public List<History> getHis(Goods goods){
		return hibernateTemplate.find("from History where goods.id = ?", goods.getId());
	}

	public void save(History his){
		hibernateTemplate.persist(his);
	}
	
}
