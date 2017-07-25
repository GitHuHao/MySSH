package com.atguigu.ssh.dao;

import java.util.List;

import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.atguigu.ssh.domain.Goods;

@Repository("goodsDao")
public class GoodsDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	public List<Goods> query(Goods goods){
		
		DetachedCriteria criteria = DetachedCriteria.forClass(Goods.class);
		if(goods.getNm()!=null&&goods.getNm().length()!=0){
			criteria.add(Restrictions.ilike("nm", goods.getNm()));
		}
		if(goods.getName()!=null&&goods.getName().length()!=0){
			criteria.add(Restrictions.ilike("name", "%"+goods.getName()+"%"));
		}
		if(goods.getStore()!=null&&goods.getStore().getId().length()!=0){
			criteria.add(Restrictions.ilike("store.id", goods.getStore().getId()));
		}
		
		List<Goods> page = hibernateTemplate.findByCriteria(criteria, 0, 10); // 起始记录,每页最大记录
		return page;
	}
	
	public void save(Goods goods){
		hibernateTemplate.persist(goods);
	}
	
	public Goods getById(Goods goods){
		return hibernateTemplate.get(Goods.class, goods.getId());
	}
	
}
