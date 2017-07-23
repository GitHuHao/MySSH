package com.atguigu.ssh.web.action;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BaseAction<T> extends ActionSupport implements ModelDriven<T> {
	
	private T t;
	public T getModel(){
		try {
			Constructor<? extends Object> constructor = t.getClass().getDeclaredConstructor(null);
			t = (T)constructor.newInstance(null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	public Object getField(){
		ClassLoader classLoader = this.getClass().getClassLoader();
		Class<?>[] interfaces = this.getClass().getInterfaces();
		InvocationHandler invocation = new InvocationHandler() {
			@Override
			public Object invoke(Object proxy, Method method, Object[] args)
					throws Throwable {
				return null;
			}
		};
		
		Object proxy = Proxy.newProxyInstance(classLoader, interfaces, invocation);
		
		return null;
	}
	
	
}
