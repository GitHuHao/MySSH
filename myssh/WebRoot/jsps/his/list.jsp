<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>历史记录</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/maple.css'/>"></link>
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
</head>
<body>
	<table border="0" class="tx" width="100%">
		<tr>
			<td>当前位置&gt;&gt;首页&gt;&gt;出入库记录</td>
		</tr>
	</table>
	<br>
	<table border="0" width="100%" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td rowspan="2">
				<form action="" method="post" name="select">
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
										<td>时间</td>
										<td>类型</td>
										<td>单位</td>
										<td>数量</td>
										<td>库存余量</td>
										<td>仓库</td>
										<td>操作员</td>
									</tr>
									<c:forEach items="${hisList}" var="his">
										<tr>
											<td>${his.goods.nm}</td>
											<td>${his.goods.name }</td>
											<td>${his.datetime }</td>
											<td>${his.type}</td>
											<td>${his.goods.unit }</td>
											<td>${his.amount}</td>
											<td>${his.remain}</td>
											<td>${his.store.addr}</td>
											<td>${his.user}</td>	
										</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>

