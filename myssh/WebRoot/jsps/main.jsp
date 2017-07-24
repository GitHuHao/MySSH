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
	<TABLE cellSpacing=0 cellPadding=0 width=984 height="120%" border=0 background="${path}/picture/bk3.jpg;" style="height: 324px; width: 983px">
		<TBODY>
			<TR>
				<TD vAlign=top width="12%" style=height: 237px;>
					<TABLE cellSpacing=0 cellPadding=0 width=104 border=0 style=height: 376px; width: 136px;>
						<TBODY>
							<TR>
								<TD valign=middle align="center" style="height: 15px; width: 107px; "><BR>
								<FONT color=#804060>--系统菜单--</FONT>
								</TD>
							</TR>
							<TR>
								<TD id=left1001 style="CURSOR:hand" valign="middle"
									align="center" background="${path}/picture/img01.jpg;" height=28>
									<FONT color=#804020>收货管理</FONT>
								</TD>
							</TR>
							<TR>
								<TD valign=middle align="center">
									<DIV id=shouhuo>
										<s:a id="left1002" action="store_list" namespace="/store" target="content">[仓库管理]</s:a>
										<BR/> 
										<A target="content" id="left1002" href="${path}/jsps/goods/list.jsp">[库存管理]</A>
										<BR/> 
										<A id="left1003" target="content" href="${path}/jsps/save/save.jsp;">[入库]</A>
										<BR/>
										<a target="content" href="${path}/jsps/out/out.jsp;">[出库]</a>
										<br/>
										<a target="content" href="${path}/jsps/his/his.jsp;">[历史记录]</a>
										<br/>
									</DIV>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
				<TD vAlign=top align=left width="88%" style="height: 222px; width: 1093px; ">
					<iframe name="content" src="${path}/picture/tyyw.bmp;" frameborder="0" width="100%" height="100%"></iframe>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</BODY>
</HTML>

