<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<html>
<head>
<title>网络在线考试</title>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<link href="<%= bp%>/css/style.css" rel="stylesheet">
</script>
</head>
<script type="text/javascript">
function checkForm(form){
	if(form.name.value==""){
		alert("请输入考生姓名!");form.name.focus();return false;
	}
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
	if(form.question.value==""){
		alert("请输入提示问题!");form.question.focus();return false;
	}
	if(form.answer.value==""){
		alert("请输入问题答案!");form.answer.focus();return false;
	}
}
</script>
<body>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="131" background="<%=bp %>/image/top_bg.jpg">&nbsp;</td>
  </tr>
</table>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="774" height="487"  border="0" cellpadding="0" cellspacing="0" align="center">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td class="word_grey">&nbsp;<img src="<%=bp %>/image/f_ico.gif" width="8" height="8"> 当前位置：→ <span class="word_darkGrey">修改个人资料 &gt;&gt;&gt;</span></td>
			  <td align="right"><img src="<%=bp %>/image/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/index.jsp" >返回首页</html:link>&nbsp;</td>
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
<form action="<%=bp%>/student/modifyStudent" method="post">
  <input type="hidden" name="id" value="${student.id }">
  <input type="hidden" name="examNum" value="${student.examNum }">
  <input type="hidden" name="createTime" value="${student.createTime }">
  <table width="57%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr>
    <td height="30" align="left" style="padding:5px;">考生姓名：</td>
    <td align="left">
     <input type="text" name="name" value="${student.name }"><font color="red">*</font></td>
    </tr>
	    <tr>
    <td align="left" style="padding:5px;">原&nbsp;密&nbsp;码：</td>
    <td align="left"><input type="text" name="pwd"><font color="red">*</font>
      </td>
    </tr>
    <tr>
    <td height="30" align="left" style="padding:5px;">新&nbsp;密&nbsp;码：</td>
    <td align="left"><input type="text" name="pwd1"><font color="red">（密码由6到20位的数字或字母组成） *</font></td>
    </tr>
  <tr align="center">
    <td width="20%" height="30" align="left" style="padding:5px;">确认新密码：</td>
    <td width="80%" align="left">
      <input type="text" name="pwd2"><font color="red">*</font></td>
    <tr>
    <tr>
    <td height="30" align="left" style="padding:5px;">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
    <td align="left">
		<input type="radio" name="sex" value="M" checked="checked">男</input>
		<input type="radio" name="sex" value="FM">女</input>    </td>
    </tr>	
    <tr align="center">
    <td width="20%" height="30" align="left" style="padding:5px;">提示问题：</td>
    <td width="80%" align="left">
      <input type="text" name="question" value="${student.question }"><font color="red">（如我的生日） *</font></td>
    </tr>
	  <tr align="center">
    <td width="20%" height="30" align="left" style="padding:5px;">问题答案：</td>
    <td width="80%" align="left">
      <input type="text" name="answer" value="${student.answer}"><font color="red">（如我的生日） （如7月17日）*</font></td>
    </tr>
	  <tr align="center">
    <td width="20%" height="30" align="left" style="padding:5px;">专&nbsp;&nbsp;&nbsp;&nbsp;业：</td>
    <td width="80%" align="left">
      <input type="text" name="profession" value="${student.profession }"></td>
    </tr>
	<tr align="center">
    <td width="20%" height="30" align="left" style="padding:5px;">身份证号：</td>
    <td width="80%" align="left">
      <input type="text" name="cardId" value="${student.cardId }"><font color="red">*</font>
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td>
      <input type="submit" styleClass="btn_grey" value="保存"/>
        &nbsp;
         <input type="reset" styleClass="btn_grey" value="取消"/>
&nbsp;
		 <input type="button" styleClass="btn_grey" value="返回" onclick="window.location.href='<%=bp%>/jsp/default.jsp'"/>	
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
<%@ include file="copyright.jsp"%>
</body>
</html>
