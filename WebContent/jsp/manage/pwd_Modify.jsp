<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<html>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<head>
<title>网络在线考试――后台管理</title>
<link href="../../css/style.css" rel="stylesheet">
</head>
<script type="text/javascript">
function checkForm(form){
	if(form.oldpwd1.value==""){
		alert("请输入的原密码!");form.oldpwd1.focus();return false;
	}
	if(form.oldpwd1.value!=form.holdpwd.value){
		alert("您输入的原密码不正确，请重新输入!");form.oldpwd1.value="";
		form.oldpwd1.focus();return false;
	}
	if(form.newpwd.value==""){
		alert("请输入的新密码!");form.newpwd.focus();return false;
	}	
	if(form.newpwd1.value==""){
		alert("请确认新密码!");form.newpwd1.focus();return false;
	}	
	if(form.newpwd.value!=form.newpwd1.value){
		alert("您两次输入的新密码不一致，请重新输入!");
		form.newpwd.value="";form.newpwd1.value="";
		form.newpwd.focus();return false;
	}
}
</script>
<body>
<%@ include file="top.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="left.jsp"%></td>
    <td width="602" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">管理员信息管理 &gt; 修改管理员密码 &gt;&gt;&gt;</span></td>
              <td align="right"><img src="../../image/m_ico1.gif" width="5" height="9">&nbsp;${manager.name }&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%">&nbsp;      </td>
</tr>
</table> 

<form action="<%=bp %>/manager/modify" method="post">
  <input type="hidden" name="id" value="${param.id }">
  <table width="63%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center">
    <td width="27%" align="left" style="padding:5px;">管理员名称：</td>
    <td width="73%" align="left">
      <input type="text" name="name" value="${param.name }" readonly="readonly">
	</td>
	  </tr>
    <tr>
    <td align="left" style="padding:5px;">原密码：</td>
    <td align="left">
    	<input type="password" name="oldpwd">
    </td>
    </tr>
    <tr>
      <td align="left" style="padding:5px;">新密码：</td>
      <td align="left">
      <input type="password" name="pwd">
      </td>
    </tr>
    <tr>
      <td align="left" style="padding:5px;">确认新密码：</td>
      <td align="left">
      <input type="password" name="confirmPwd"></td>
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td>
      	<input type="submit"  class="btn_grey" value="保存"/>
        &nbsp;
        <input type="reset"  class="btn_grey" value="取消"/>
        <html:reset property="reset" styleClass="btn_grey" value="取消"/>
		&nbsp;
		<input type="button"  class="btn_grey" value="返回" onclick="window.location.href='/OnlineExam/manager/refreshPage'"/>
		</td>
    </tr>
</table>
</form>
</td>
      </tr>
    </table>
</td>
  </tr>
</table>
<%@ include file="../copyright.jsp"%>
</body>
</html>
