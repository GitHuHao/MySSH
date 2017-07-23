<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加新仓库</title>
<link rel="stylesheet" type="text/css"
	href="${path}/css/maple.css"></link>
<style type="text/css">
	.tx td{
		padding:3px;
	}
</style>
</head>
<body>
	<!-- 中间内容（开始） -->
	<table border="0" class="tx" width="100%">
		<tr>
			<td>当前位置&gt;&gt;首页&gt;&gt;创建新仓库</td>
		</tr>
	</table>
	<br>
	<table border="0" width="100%" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td rowspan="2">
				<s:form id="store_update" name="select" action="store_update" namespace="/store" target="_top" method="post" theme="simple">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tx" align="center">
						<colgroup>
							<col width="20%" align="right">
							<col width="*%" align="left">
						</colgroup>
						<tr>
							<td bgcolor="a0c0c0" style="padding-left:10px;" colspan="2" align="left">
								<b>创建新仓库：</b>
							</td>
						</tr>
						<tr>
							<td>
								仓库名称：
							</td>
							<td>
								<s:hidden name="id" value="%{model.id}"/>
								<s:textfield name="name" value="%{model.name}" id="store_update_name" cssClass="tx"/>
							</td>
						</tr>
						<tr>
							<td>
								仓库地址：
							</td>
							<td>
								<s:textfield name="addr" value="%{model.addr}" id="store_update_addr" cssClass="tx"/>
							</td>
						</tr>
						<tr>
							<td>
								库管员：
							</td>
							<td>
								<s:textfield name="manager" value="%{model.manager}" id="store_update_manager" cssClass="tx"/>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center" style="padding-top:10px;">
								<s:submit cssClass="tx" cssStyle="width:120px;margin-right:30px;" value="确定"/>
								<s:reset cssClass="tx" cssStyle="width:120px;margin-right:30px;" value="取消"/>
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
							1.输入仓库的名称,地址
							<br/>
							2.保存后直接去显示仓库列表
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

