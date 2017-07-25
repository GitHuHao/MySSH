package com.atguigu.ssh.web.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.atguigu.ssh.domain.Goods;
import com.atguigu.ssh.domain.History;
import com.atguigu.ssh.service.GoodsService;
import com.atguigu.ssh.service.HistoryService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("goodsAction")@Scope("prototype")
public class GoodsAction extends ActionSupport implements ModelDriven<Goods> {

	@Autowired
	private GoodsService goodsService;
	
//	@Autowired
	private HistoryService hisService;
	
	private Goods goods = new Goods();
	
	private List<History> hisList;
	
	private List<Goods> page;
	
	public String ajaxQuery(){
		page = goodsService.query(goods);
		return "ajaxQuery";
	}
	
	public Goods getModel(){
		return goods;
	}

	public List<Goods> getPage() {
		return page;
	}
	
	public String save(){
		goodsService.save(goods);
		return "save";
	}
	
	public String plus(){
		goodsService.plus(goods);
		return "plus";
	}
	
	public String minus(){
		goodsService.minus(goods);
		return "minus";
	}
	
	public String toAddJsp(){
		return "toAddJsp";
	}
	
	public String toListJsp(){
		return "toListJsp";
	}
	
	public String toExportJsp(){
		goods = goodsService.getById(goods);
		return "toExportJsp";
	}
	
	public String toImportJsp(){
		goods = goodsService.getById(goods);
		return "toImportJsp";
	}
	
	public String hisList(){
		hisList = hisService.getAll(goods);
		return "hisList";
	}

	public List<History> getHisList() {
		return hisList;
	}

}
