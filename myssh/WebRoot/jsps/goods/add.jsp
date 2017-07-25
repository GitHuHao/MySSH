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
		// 动态加载下拉列选
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
				}
			}
		});	
		// 提交表单前非空,数字校验
		$("#sub").click(function(event){
			if($("#nm").val()==""||$("#name").val()==""||isNaN($("#amount").val())||$("#s_sel").val()==""){
				event.preventDefault();
			};
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
				<s:form id="goods_save" name="select" namespace="/goods" action="goods_save" method="post" theme="simple"> 
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
								<s:textfield name="nm" id="nm" class="tx"/>
							</td>
						</tr>
						<tr>
							<td>
								货物名称：
							</td>
							<td>
								<s:textfield name="name" id="name" class="tx"/>
							</td>
						</tr>
						<tr>
							<td>
								计量单位：
							</td>
							<td>
								<s:textfield name="unit" id="unit" class="tx"/>
							</td>
						</tr>
						<tr>
							<td>
								入库数量：
							</td>
							<td>
								<s:textfield name="amount" id="amount" value="" class="tx"/>
							</td>
						</tr>
						<tr>
							<td>
								选择仓库：
							</td>
							<td>
								<!-- 提交数据封装 model中  -->
								<select class="tx" style="width:120px;" name="store.id" id="s_sel">
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center" style="padding-top:10px;">
								<s:submit id="sub" cssClass="tx" cssStyle="width:120px;margin-right:30px;" value="入库"/>
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
