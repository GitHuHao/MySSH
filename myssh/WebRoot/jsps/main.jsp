<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<link href="${path}/css/maple.css;" type="text/css" rel=stylesheet></link>
</head>
<BODY topMargin=0 rightMargin=0 marginwidth="0" marginheight="0" style="height: 370px; width: 1275px; ">
	<TABLE height=91 cellSpacing=0 cellPadding=0 width=984
		background="${path}/picture/topbk.jpg;" border=0 style="width: 1264px; ">
		<TBODY>
			<TR>
				<TD width=733 background="${path}/picture/header.jpg;"></TD>
				<TD><FONT style="FONT-SIZE: x-small" color=#fffaed><BR>
					<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<FONT color=#804060>当前用户：${loginUser.name } </font> 
					</FONT>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
	<TABLE cellSpacing=0 cellPadding=0 width=984 height="120%" border=0 background="${path}/picture/bk3.jpg;" style="height: 300px; width: 983px">
		<TBODY>
			<TR>
				<TD vAlign=top width="12%" style="height: 282px" 237px;>
					<TABLE cellSpacing=0 cellPadding=0 width=104 border=0 style="height: 272px" 376px; width: 136px;>
						<TBODY>
							<TR>
								<TD valign=middle align="center" style="height: 8px; width: 107px; "><BR>
								<FONT color=#804060>--系统菜单--</FONT>
								</TD>
							</TR>
							<TR>
								<TD id=left1001 style="CURSOR:hand; height: 7px" valign="middle"
									align="center" background="${path}/picture/img01.jpg;" height=28>
									<FONT color=#804020>收货管理</FONT>
								</TD>
							</TR>
							<TR>
								<TD valign=middle align="center" style="height: 129px; ">
									<DIV id=shouhuo style="height: 178px; ">
										<s:a id="left1002" action="store_list" namespace="/store" target="_content">[仓库管理]</s:a><BR/> 
										<s:a id="left1003" action="goods_toListJsp" namespace="/goods" target="_content">[库存管理]</s:a><BR/> 
										<s:a id="left1002" action="goods_toAddJsp" namespace="/goods" target="_content">[添加货物]</s:a><BR/> 
									</DIV>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
				<TD vAlign=top align=left width="88%" style="height: 277px; width: 1093px;">
					<iframe name="_content" src="${path}/picture/tyyw.bmp;" frameborder="0" width="100%" height="100%"></iframe>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</BODY>
</HTML>

