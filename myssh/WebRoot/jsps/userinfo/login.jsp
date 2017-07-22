<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
	String path=request.getContextPath();
	String bashPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>用户登陆</TITLE>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/maple.css" />
<%-- <script type="text/javascript" src="<%=path%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.metadata.js"></script>
<script type="text/javascript" src="<%=path%>/js/message_zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		// 添加客户端校验
		$("#loginForm").validate();
	});
</script> --%>
</HEAD>
<BODY  bgColor=#ffffff leftMargin=0 background="<%=path%>/picture/bj1.gif" topMargin=0>
		<form id="loginForm" name="loginForm" action="<%=path%>/login.action" method="post" style="margin-top:250px;">
			<DIV align=center>
				<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%"
					border=0>
					<TBODY>
						<TR>
							<TD>
								<TABLE cellSpacing=0 cellPadding=0 width=623 align=center
									border=0>
									<TBODY>
										<TR>
											<TD align="center" colSpan=3 width="623" height="260"
												background="<%=path%>/picture/welcome_01.gif">
												<!-- 验证码返回提示 --> <br> <br> <br> <br> <br>
												<font color="#ff60a0" size="5">
													
												</font>
											</TD>
										</TR>
										<TR>
											<TD rowSpan=4>
												<IMG height=92 src="<%=path%>/picture/welcome_02.gif" width=46></TD>
											<TD align="right" background="" height=13>
												<DIV align=left>
													
														<ul id="loginForm_" class="errorMessage">
           												 <li><span>用户名或者密码错误</span></li>	
            									</ul>

													<FONT color=#006633 size=2>用户名：</FONT><FONT color=#006633
														size=2> 
														<input type="text" name="name" size="15" maxlength="15" value="tom" id="loginForm_name" class="tx {required:true,rangelength:[3,12]}"/>
													</FONT><FONT color=#006633 size=2>
													</FONT>
												</DIV></TD>
											<TD rowSpan=4>
												<IMG height=92 src="<%=path%>/picture/welcome_04.gif" width=402></TD>
										</TR>
										<TR>
											<TD Align=left background="" height=9>
												<DIV align=left>
													<FONT color=#006633 size=2>密码：
													 <input type="password" name="password" size="15" maxlength="15" id="loginForm_password" class="tx required"/>
													</FONT>
												</DIV>
											</TD>
										</TR>

										<TR>
											<TD align="left" height=21>
												<DIV align=center>
													<FONT color=#006633 size=2> <input class=txt1
														style="BACKGROUND-COLOR: #ffffff" type=submit value=确定
														name=ChkCngPwd2> <INPUT class=txt1
														style="BACKGROUND-COLOR: #ffffff" type=reset value=取消
														name=ChkCngPwd> </FONT>
												</DIV>
											</TD>
										</TR>
										<TR>
											<TD align="center" height=2 width="175" background="<%=path%>/picture/welcome_05.gif"></TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
				<FONT color=red></FONT>
			</DIV>
		</form>




</BODY>
</HTML>

>