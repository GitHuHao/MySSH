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
		// 页面自动提取查找到的待删除对象,检测是否存在货物,决定删除与否
		store = storeService.getById(store);
		return "ajaxDelCheck";
	}
	
	public String delete(){
		// 直接放行,执行删除,页面会跳转
//		try{
			storeService.delete(store);
//		}catch(Exception e){
//			this.addActionError(this.getText("store.del.error"));
//		}
		return "delete";
	}
	
	public String deleteByAjax(){
		// 使用ajax执行后台删除操作如果删除成功,返回store对象为空,再删除前端<tr>
		storeService.delete(store);
		store=null;
		return "deleteByAjax";
	}
	
	public String ajaxSelectList(){
		storeList = storeService.getAll();
		return "ajaxSelectList";
	}
	
	
	public Store getModel(){
		return store;
	}
	public Store getStore(){
		// 返回Action在struts.xml 指定的root对象,即json格式回调对象
		return store;
	}
	
	public List<Store> getStoreList() {
		return storeList;
	}
	
}
 