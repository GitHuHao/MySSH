<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		$("#amount").blur(function(){
			origin_amount = $("#origin_amount").val();
			new_amount = $(this).val();
			if(isNaN(new_amount) || new_amount<0){
				$(this).val(origin_amount);
			}
		});
	});
</script>
</head>
<body>
	<!-- 中间内容（开始） -->
	<table border="0" class="tx" width="100%">
		<tr>
			<td>当前位置&gt;&gt;首页&gt;&gt;入库</td>
		</tr>
	</table>
	<br>
	<table border="0" width="100%" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td rowspan="2">
				<s:form id="goods_minus" name="select" namespace="/goods" action="goods_plus.action" method="post" theme="simple"> 
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tx" align="center">
						<colgroup>
							<col width="20%" align="right">
							<col width="*%" align="left">
						</colgroup>
						<tr>
							<td bgcolor="a0c0c0" style="padding-left:10px;" colspan="2" align="left">
								<b>货物入库登记：</b>
							</td>
						</tr>
						<tr>
							<td>
								简记码：
							</td>
							<td>
								<s:hidden id="hid" name="id" value="%{model.id}"/>
								<s:textfield name="nm" value="%{model.nm}" id="nm" class="tx" readonly="true"/>
							</td>
						</tr>
						<tr>
							<td>
								货物名称：
							</td>
							<td>
								<s:textfield name="name" value="%{model.name}" id="name" class="tx" readonly="true"/>
							</td>
						</tr>
						<tr>
							<td>
								计量单位：
							</td>
							<td>
								<s:textfield name="unit" value="%{model.unit}" id="unit" class="tx" readonly="true"/>
							</td>
						</tr>
						<tr>
							<td>
								入库数量：
							</td>
							<td>
								<s:hidden id="origin_amount" value="%{model.amount}"/>
								<s:textfield name="amount" value="%{model.amount}" id="amount" class="tx"/>
							</td>
						</tr>
						<tr>
							<td>
								仓库：
							</td>
							<td>
								<s:hidden name="store.id" value="%{model.store.id}"/>
								<s:textfield name="store.name" value="%{model.store.name}" id="store_id" class="tx" readonly="true"/>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center" style="padding-top:10px;">
								<s:submit id="sub" cssClass="tx" cssStyle="width:120px;margin-right:30px;" value="入库" />
								<s:reset id="reset" cssClass="tx" cssStyle="width:120px;margin-right:30px;" value="取消" />
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
							1.输入简记码从数据库<br/>查询是否已经存在此
							<br/>货物
							<br/>
							2.没有则直接输入货物名称
							<br>
							3.从数据库选择仓库
							<br>
							4.向仓库中新添加或是追加货物
							<br/>
							5.记录入库历史记录
						</td>
					</tr>
					<tr>
						<td><img src="${path}/picture/bottom.jpg"></td>
					</tr>
				</table>
		</tr>
	</table>
</body>
</html>
