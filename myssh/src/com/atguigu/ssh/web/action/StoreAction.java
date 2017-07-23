package com.atguigu.ssh.web.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.atguigu.ssh.domain.Store;
import com.atguigu.ssh.service.StoreService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("storeAction")@Scope("prototype")
public class StoreAction extends ActionSupport implements ModelDriven<Store> {
	
	@Autowired
	private StoreService storeService;

	private Store store = new Store();
	private List<Store> storeList;
	
	public String list(){
		storeList = storeService.getAll();
		return "list";
	}
	
	public String toAddJsp(){
		return "toAddJsp";
	}
	
	public String add(){
		storeService.save(store);
		return "add";
	}
	
	public String toUpdateJsp(){
		store = storeService.getById(store);
		System.out.println(store.getAddr());
		return "toUpdateJsp";
	}
	
	public String update(){
		storeService.update(store);
		return "update";
	}
	
	public String delCheck(){
		store = storeService.getById(store);
		return "ajaxDelCheck";
	}
	
	public String delete(){
		storeService.delete(store);
		return "delete";
	}
	
	public String deleteByAjax(){
		storeService.delete(store);
		store=null;
		return "deleteByAjax";
	}
	
	public Store getModel(){
		return store;
	}
	public Store getStore(){
		return store;
	}
	
	public List<Store> getStoreList() {
		return storeList;
	}
	
}
 