<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
	String path=request.getContextPath();
	String bashPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("bashPath", bashPath);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>用户登陆</TITLE>
<link rel="stylesheet" type="text/css" href="${path}/css/maple.css" />
</HEAD>
<BODY  bgColor=#ffffff leftMargin=0 background="${path}/picture/bj1.gif" topMargin=0>
		<s:debug/>
		<s:form id="loginForm" name="loginForm" action="login" namespace="/" method="post" cssStyle="margin-top:250px" theme="simple">
			<DIV align=center>
				<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%"
					border=0>
					<TBODY>
						<TR>
							<TD>
								<TABLE cellSpacing=0 cellPadding=0 width=623 align=center border=0>
									<TBODY>
										<TR>
											<TD align="center" colSpan=3 width="623" height="260"
												background="${path}/picture/welcome_01.gif">
												<font color="#ff60a0" size="5">
													<!-- struts-validation一次性显示全部校验信息 -->
													<!-- <s:fielderror/> -->
												</font>
											</TD>
										</TR>
										<TR>
											<TD rowSpan=4>
												<IMG height=92 src="${path}/picture/welcome_02.gif" width=46></TD>
											<TD align="left" background="" height=9>
												<DIV align=left>
													<FONT color=#006633 size=2>
														用户名:<s:textfield id="loginForm_name" name="name"/>
														<s:fielderror fieldName="name"/><!-- struts-validation 按属性分别显示校验信息 -->
													</FONT>
												</DIV>
											</TD>
											<TD rowSpan=4>
												<IMG height=92 src="${path}/picture/welcome_04.gif" width=402>
											</TD>
										</TR>
										<TR>
											<TD Align=left background="" height=9>
												<DIV align=left>
													<FONT color=#006633 size=2>
														密码:<s:password id="loginForm_password" name="password"/>
														<s:fielderror fieldName="password"/>
													</FONT>
												</DIV>
											</TD>
										</TR>

										<TR>
											<TD align="left" height=21>
												<DIV align=center>
													<FONT color=#006633 size=2> 
													<s:submit class="txt1" cssStyle="BACKGROUND-COLOR: #ffffff" value="确定"/>
													<s:reset class="txt1" cssStyle="BACKGROUND-COLOR: #ffffff" value="取消"/> 
													</FONT>
												</DIV>
											</TD>
										</TR>
										<TR>
											<TD align="center" height=2 width="175" background="${path}/picture/welcome_05.gif"></TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
				<FONT color=red></FONT>
			</DIV>
		</s:form>
</BODY>
</HTML>