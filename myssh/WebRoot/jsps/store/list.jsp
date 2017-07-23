<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>    
<%
	pageContext.setAttribute("path", request.getContextPath());
%>    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>仓库管理</title>
<link rel="stylesheet" type="text/css"
	href="${path}/css/maple.css"></link>
<style type="text/css">
	.tx td{
		padding:3px;
	}
	.store{
		width:100%;
		border:1px solid gray;
		border-collapse:collapse;
	}
	.store td{
		border:1px solid gray;
		padding:3px;
	}
	.store a{
		text-decoration:underline;
		color:blue;
	}
</style>
<script type="text/javascript" src="${path}/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function(){
		$(".delLink").click(function(event){
			var url=$(this).attr("href");
			var param_str = url.split("?")[1];
			var store_id = param_str.split("&")[0].split("=")[1];
			// 只有在控制台才会打印,比alert()调试更为和谐
			// console.log(url+"\n"+param_str+"\n"+store_id);
			$.ajax({
		         type: 'post',
		         url: "${path}/store/store_delCheck.action",
		         data:{"id":store_id},
		         dataType: 'json',
		         async : false,
		         success: function(store){
		        	 // json 格式对象包含集合的非空判断
		        	if(store.goodses==""){
		        		var isConfirm = window.confirm("确认删除吗?");
		        		if(!isConfirm){
		        			event.preventDefault();
		        		};
		        	}else{
		        		alert("当前仓库存在货物禁止删除!");
		        		event.preventDefault();
		        	}
		         },
		         error:function(){
		        	alert("error");
		         }
			});	
		});
	});
</script>
</head>
<body>
	<table border="0" class="tx" width="100%">
		<tr>
			<td>当前位置&gt;&gt;首页&gt;&gt;仓库管理</td>
		</tr>
	</table>
	<br>
	<table border="0" width="100%" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td rowspan="2">
				<s:form action="store_toAddJsp" namespace="/store" method="get" theme="simple">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tx" align="center">
						<colgroup>
							<col width="20%" align="right">
							<col width="*%" align="left">
						</colgroup>
						<tr>
							<td bgcolor="a0c0c0" style="padding-left:10px;" colspan="1" align="left">
								<b>已经有仓库：</b>
							</td>
						</tr>
						<tr>
							<td>
								<table class="store">
									<tr style="background:#D2E9FF;text-align: center;">
										<td>名称</td>
										<td>地址</td>
										<td>管理员</td>
										<td>操作</td>
									</tr>
									<!-- value 也可以写 #request.stores , #attr.stores -->
									<s:iterator value="storeList" var="store">
										<tr>
											<td>${name}</td>
											<td>${addr} </td>
											<td><s:property value="#store.manager"/></td>
											<td>
												<s:a action="store_toUpdateJsp" namespace="/store">修改
													<s:param name="id" value="#store.id"/>
												</s:a>
												<s:a action="store_delete" cssClass="delLink">删除
													<s:param name="id" value="#store.id"/>
													<s:param name="name" value="#store.id"/>
												</s:a>
											</td>		
										</tr>
									</s:iterator>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right" style="padding-top:10px;">
								<!-- struts 的button 标签需要嵌套在form 以get提交才能生效 -->
								<s:submit cssClass="tx" cssStyle="width:120px;margin-right:30px;" value="创建新仓库"/>
							</td>
						</tr>
					</table>
				</s:form>	
			</td>
			<td valign="top" width="20%">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td background="${path}/picture/loginpage.gif" align="center"><br>
						<font color="red">操作步骤</font>
						</td>
					</tr>
					<tr>
						<td background="${path}/picture/bg1.jpg" style="padding-left:10px;">
							1.显示所有货物的库存情况
							<br/>
							2.根据条件查询某种货的库存情况
							<br/>
							3.出入库完成后显示某种货物的库存情况
						</td>
					</tr>
					<tr>
						<td><img src="${path}/picture/bottom.jpg"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>

