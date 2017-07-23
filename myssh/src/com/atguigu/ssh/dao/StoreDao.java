package com.atguigu.ssh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.atguigu.ssh.domain.Store;

@Repository("storeDao")
public class StoreDao {

	@Resource
	private HibernateTemplate hibernateTemplate;
	
	public void save(Store store){
		hibernateTemplate.persist(store);
	}
	
	public List<Store> getAll(){
		return hibernateTemplate.find("from Store");
	}
	
	public Store getById(Store store){
		store = hibernateTemplate.get(Store.class, store.getId());
		hibernateTemplate.clear(); // 清除持久状态对象,防止同一个session中管理多个相同id的对象
		return store;
	}
	
	public void update(Store store){
		hibernateTemplate.update(store);
	}
	
	public void delete(Store store){
		hibernateTemplate.delete(store);
	}
	
}
