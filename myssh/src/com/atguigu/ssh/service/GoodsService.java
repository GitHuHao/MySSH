package com.atguigu.ssh.service;

import java.util.List;

import com.atguigu.ssh.domain.Goods;

public interface GoodsService {

	List<Goods> query(Goods goods);
	void save(Goods goods);
	Goods getById(Goods goods);
	void plus(Goods goods);
	void minus(Goods goods);
}
