<%@ page contentType="text/html; charset=utf-8" language="java"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<title>网络在线考试――后台登录</title>
<link href="<%=bp %>/css/style.css" rel="stylesheet">
<script type="text/javascript">
function goIndex(){
	window.location.href="<%=bp%>/jsp/index.jsp";
}
function check(form){
	if (form.name.value==""){
		alert("请输入管理员名称!");form.name.focus();return false;
	}
	if (form.pwd.value==""){
		alert("请输入密码!");form.pwd.focus();return false;
	}	
}
</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#EEEEEE"><table width="464" height="294" border="0" align="center" cellpadding="0" cellspacing="0" background="<%=bp %>/image/m_login.jpg">
      <tr>
        <td width="157" height="153">&nbsp;</td>
        <td width="307">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">
        <form action="<%=bp%>/manager/login" method="post">
<!-- <html:form action="manage/manager.do?action=login" method="post" focus="name" onsubmit="return check(managerForm)"> -->
                      <table width="100%"  border="0" cellpadding="0" cellspacing="0" bordercolorlight="#FFFFFF" bordercolordark="#D2E3E6">
                        <tr>
                          <td width="26%" height="30">管理员名称：</td>
                      <td width="74%">
                      	<input type="text" name="name">
                      </td>
                      </tr>
                        <tr>
                          <td height="30">管理员密码：</td>
                      <td><input type="password" name="pwd"></td>
                      </tr>
                        <tr>
                          <td height="33" colspan="2" align="center">
                          <input type="submit" value="确定" class="btn_grey">
                        &nbsp;
                        <input type="reset" value="重置" class="btn_grey">&nbsp;
						<input type="button" value="关闭" class="btn_grey" onclick="goIndex()"></td>
                      </tr>
              </table> 
<!-- 		    </html:form>		 -->
</form>
		</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
