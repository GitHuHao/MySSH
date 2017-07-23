package com.atguigu.ssh.service;

import java.util.List;

import com.atguigu.ssh.domain.Store;

public interface StoreService {

	void save(Store store);
	void update(Store store);
	void delete(Store store);
	Store getById(Store store);
	List<Store> getAll();
	boolean isEmpty(Store store);
	
}
