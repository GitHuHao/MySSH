package com.atguigu.ssh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atguigu.ssh.dao.GoodsDao;
import com.atguigu.ssh.domain.Goods;
import com.atguigu.ssh.service.GoodsService;
@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

	@Resource
	private GoodsDao goodsDao;
	
	@Transactional
	public List<Goods> query(Goods goods) {
		List<Goods> page = goodsDao.query(goods);
		return page;
	}
	
	@Transactional
	public void save(Goods goods) {
		double inputAmount = goods.getAmount();
		goodsDao.save(goods);
	}
	
	@Transactional(readOnly=true)
	public Goods getById(Goods goods) {
		return goodsDao.getById(goods);
	}
	
	@Transactional
	public void plus(Goods goods) {
		double addAmount = goods.getAmount();
		goods = goodsDao.getById(goods);
		goods.setAmount(goods.getAmount()+addAmount);
	}
	
	@Transactional
	public void minus(Goods goods) {
		double addAmount = goods.getAmount();
		goods = goodsDao.getById(goods);
		goods.setAmount(goods.getAmount()-addAmount);
	}
	
	
}
