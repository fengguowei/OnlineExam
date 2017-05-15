<%@ page contentType="text/html; charset=utf-8" language="java"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<title>网络在线考试</title>
<link href="<%=bp %>/css/style.css" rel="stylesheet">
<script type="text/javascript">
var returnStr = '${examNum}';
if(returnStr!=null && returnStr!=''){
	alert("恭喜你，注册成功，您的考号是："+returnStr);
}

var errorLogin = '${errorLogin}';
if(errorLogin!=null && errorLogin!=''){
	alert(errorLogin);
}

function check(form){
	if (form.name.value==""){
		alert("请输入准考证号!");
		form.name.focus();
		return false;
	}
	if (form.pwd.value==""){
		alert("请输入密码!");
		form.pwd.focus();
		return false;
	}
}
</script>
</head>
<body>
<form action="<%=bp%>/student/login">
<table width="778" height="266" border="0" align="center" cellpadding="0" cellspacing="0" background="<%=bp %>/image/login_top.jpg">
  <tr>
    <td width="118" colspan="2">&nbsp;</td>
  </tr>
</table>
<table width="778" height="158"  border="0" align="center" cellpadding="0" cellspacing="0" background="<%=bp %>/image/login_mid.jpg">
	<tr><td><table width="100%"  border="0" cellpadding="0" cellspacing="0" bordercolorlight="#FFFFFF" bordercolordark="#D2E3E6">
                <tr><td>&nbsp;</td><td></td><td></td></tr>
				<tr><td width="35%" height="30">&nbsp;</td>
					<td width="9%" height="30">准考证号：</td>
                    <td width="27%">
					   <input type="text" class="logininput" name="examNum">                      </td>
                      <td width="29%">&nbsp;</td>
                    </tr>
                        <tr>
                          <td height="30">&nbsp;</td>
                      <td height="30">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                      <td>
                      <input type="password" name="pwd" class="logininput">
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                        <tr>
                          <td height="31">&nbsp;</td>
                      <td height="31" colspan="2" align="left">
                      <input type="submit" class="btn_grey" value="登录">
                        &nbsp;
						<input type="reset" class="btn_grey" value="重置">
                        <input type="button" class="btn_grey" onclick="window.location.href='<%=bp %>/jsp/register.jsp'" value="注册"></button>
                        &nbsp;
                     <input type="button" class="btn_grey" onclick="window.location.href='<%=bp %>/jsp/seekPwd.jsp'" value="找回密码"></button>
                      <td>&nbsp;</td>
                    </tr>
                        <tr>
                          <td height="40">&nbsp;</td>
                          <td height="31" colspan="2" align="right" valign="bottom">
                          <a href="<%=bp %>/jsp/manage/login.jsp" class="word_orange">进入后台</a>
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                    </table> 
		    </td>
  </tr>
</table>

<table width="778" height="196" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="182" background="<%=bp %>/image/login_bottom.jpg">&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>
