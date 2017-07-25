package com.atguigu.ssh.aspect;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atguigu.ssh.dao.HistoryDao;
import com.atguigu.ssh.domain.Goods;
import com.atguigu.ssh.domain.History;
import com.atguigu.ssh.domain.Userinfo;
import com.atguigu.ssh.service.HistoryService;

//@Aspect@Service("hisService")
public class HisRecord implements HistoryService{

//	@Autowired
	private HistoryDao hisDao;
	
//	@Pointcut(value="execution(* com.atguigu.ssh.service.impl.GoodsServiceImpl.save(..))||" +
//					"execution(* com.atguigu.ssh.service.impl.GoodsServiceImpl.minus(..))||" +
//					"execution(* com.atguigu.ssh.service.impl.GoodsServiceImpl.plus(..))")
	private void hisRecPoint(){} // 切入点必须时 私有,无参,无返回值方法
	
	@Transactional
//	@Around(value="hisRecPoint()")
	public Object record(ProceedingJoinPoint joinPoint) throws Throwable{
		
		String methodName = joinPoint.getSignature().getName();
		Goods goods = (Goods)joinPoint.getArgs()[0];
		String datetime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
		String type=methodName.contains("save")?"入库":"出库";
		// hibernate 可以通过操作pojo对象操作数据库,执行查询,更新操作
		double amount=goods.getAmount();
		
		String user = ((Userinfo)ServletActionContext.getRequest().getSession().getAttribute("loginUser")).getName();
		
		Object proceed = joinPoint.proceed();
		double remain = goods.getAmount();
		hisDao.save(new History(goods, datetime, type, amount, remain, user));
		return proceed;
	}
	
	@Transactional
	public List<History> getAll(Goods goods){
		return hisDao.getHis(goods);
	}

	public void setHisDao(HistoryDao hisDao) {
		this.hisDao = hisDao;
	}
	
}
