package com.atguigu.ssh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atguigu.ssh.dao.GoodsDao;
import com.atguigu.ssh.dao.StoreDao;
import com.atguigu.ssh.domain.Store;
import com.atguigu.ssh.service.StoreService;

@Service("storeService")
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDao storeDao;

	@Transactional
	public void save(Store store) {
		storeDao.save(store);
	}

	@Override
	public void update(Store store) {
		storeDao.update(store);
	}

	@Override
	public void delete(Store store) {
		store = storeDao.getById(store);
		if(store.getGoodses()==null||store.getGoodses().isEmpty()){
			storeDao.delete(store);
		}else{
			throw new RuntimeException("该仓库存在货物,不能直接删除!");
		}
	}

	@Transactional(readOnly=true)
	public Store getById(Store store) {
		return storeDao.getById(store);
	}

	@Transactional(readOnly=true)
	public List<Store> getAll() {
		return storeDao.getAll();
	}
	
	@Transactional(readOnly=true)
	public boolean isEmpty(Store store){
		store = storeDao.getById(store);
		if(store.getGoodses()==null||store.getGoodses().isEmpty()){
			return true;
		}
		return false;
	}
	
}
