<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>货物统计</title>
<link rel="stylesheet" type="text/css" href="${path}/css/maple.css"></link>
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
<!-- 引入jquery , jquery版本使用1.4+ -->
<script type="text/javascript" src="${path}/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"${path}/store/store_ajaxSelectList.action",
			type:"get",
			success:function(data){
				console.log(data.storeList);
				if(data!=null){
					var opts="";
					for(var i=0;i<data.storeList.length;i++){
						store = data.storeList[i];
						opts=opts+"<option value='"+store.id+"'>"+store.name+"</option>";
					} 
					opts ="<option value=''>-请选择仓库-</option>"+opts;
					$("#s_sel").append(opts);
					// $("#s_sel").prop("list",data.storeList);
				}
			}
		});
	});
</script>
</head>
<body>
	<table border="0" class="tx" width="100%">
		<tr>
			<td>当前位置&gt;&gt;首页&gt;&gt;货物库存</td>
		</tr>
	</table>
	<br>
	<table border="0" width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td rowspan="1">
				<s:form id="goods_list" name="select" namespace="/goods" action="goods_list" method="post" theme="simple">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tx" align="center">
						<colgroup>
							<col width="20%" align="right">
							<col width="*%" align="left">
						</colgroup>
						<tr>
							<td bgcolor="a0c0c0" style="padding-left:10px;" colspan="2" align="left">
								<b>查询条件：</b>
							</td>
						</tr>
						<tr>
							<td>
								简记码：
							</td>
							<td>
								<s:textfield name="nm" id="nm" cssClass="tx"/><font style="color:red;size:3">*例:ASPL</font>
							</td>
						</tr>
						<tr>
							<td>
								货物名称：
							</td>
							<td>
								<s:textfield name="name" id="name" cssClass="tx"/><font style="color:red;size:3">*例:阿司匹林</font>
							</td>
						</tr>
						<tr>
							<td>
								选择仓库：
							</td>
							<td>
								<s:select id="s_sel" list="{}" key="id" name="store.id" value="name">
								</s:select>
								<select class="tx" style="width: 120px;" name="store.id" id="s_sel">
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right" style="padding-top:10px;">
								<s:submit cssClass="tx" cssStyle="width:120px;margin-right:30px;" value="查询" />
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
		<tr valign="top">
			<td rowspan="2">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tx" align="center">
						<colgroup>
							<col width="20%" align="right">
							<col width="*%" align="left">
						</colgroup>
						<tr>
							<td bgcolor="a0c0c0" style="padding-left:10px;" colspan="1" align="left">
								<b>货物库存：</b>
							</td>
						</tr>
						<tr>
							<td>
								<table class="store">
									<tr style="background:#D2E9FF;text-align: center;">
										<td>简记码</td>
										<td>名称</td>
										<td>计量单位</td>
										<td>库存数量</td>
										<td>所在仓库</td>
										<td>操作</td>		
									</tr>
									<s:iterator value="goodsList" var="goods">
										<tr>
											<td><s:property value="#goods.nm"/></td>
											<td><s:property value="#goods.name"/></td>
											<td><s:property value="#goods.unit"/></td>
											<td><s:property value="#goods.amount"/></td>
											<td><s:property value="#goods.store.name"/></td>
											<td>
												<s:a action="goods_toExportJsp" namespace="/goods">出库
													<s:param name="id" value="#goods.id"/>
												</s:a>&nbsp;&nbsp;
												<s:a action="goods_toImportJsp" namespace="/goods">出库
													<s:param name="id" value="#goods.id"/>
												</s:a>&nbsp;&nbsp;
												<s:a action="goods_hisList" namespace="/goods">历史记录
													<s:param name="id" value="#goods.id"/>
												</s:a>
											</td>
										</tr>
									</s:iterator>
								</table>
							</td>
						</tr>
					</table>
			</td>
		</tr>
	</table>
</body>
</html>

