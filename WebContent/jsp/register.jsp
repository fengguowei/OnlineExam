<%@ page contentType="text/html; charset=utf-8" language="java"%>
<html>
<head>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<title>网络在线考试</title>
<link href="../css/style.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<script type="text/javascript">


$(document).ready(function(){
	//选择器
// 	$("#commit")//主键选择器，选择出主键为commit的元素
// 	$("input")//标签选择器，选择出所有的input标签的元素
// 	$(".btn_grey")//类选择器，选出所有btn_grey样式的元素

	//js的事件
//1、blur：失去焦点的时候出发
//2、focus:聚焦
//3、click：单击
//4、dblclick
	validate();
	$("#commit").click(function(){
		if(validate()){
			$("#form-data").submit();
		}else{
			alert("表单不可以为空");
		}
	});
});
function validate(){
	$("input[name='name']").blur(function(){
		var name_value = $(this).val();
		if(name_value == '' || name_value == null ){
			alert("请输入姓名，姓名不可以为空");
			return false;
		}
	});
	return true;
}

//用Jquery的Ajax方式来提交
function search() {
	$.ajax({
		async : false,
		type : "POST",
		url : "${_base}/student/register",
		success : function(data) {
			alert(data);
		}
	});
}

function checkForm(form){
	if(form.name.value==""){
		alert("请输入考生姓名!");form.name.focus();return false;
	}
	if(form.password1.value==""){
		alert("请输入登录密码!");form.password1.focus();return false;
	}
	if(form.password1.value.length<6 || form.password1.value.length>20){
		alert("您输入的密码不合法，密码必须大于6位，并且小于等20位!");form.password1.focus();return false;
	}
	if(form.password2.value==""){
		alert("请确认登录密码!");form.password2.focus();return false;
	}		
	if(form.password1.value!=form.password2.value){
		alert("您两次输入的登录密码不一致，请重新输入!");form.password1.focus();return false;
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
              <td class="word_grey">&nbsp;<img src="<%=bp %>/image/f_ico.gif" width="8" height="8"> 当前位置：→ <span class="word_darkGrey">考生注册 &gt;&gt;&gt;</span></td>
			  <td align="right"><img src="<%=bp %>/image/m_ico1.gif" width="5" height="9">&nbsp;<a href="index.jsp" >返回首页<a>&nbsp;</td>
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
<form id="form-data" action="../student/register" method="post">
  <table width="57%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr>
    <td height="30" align="left" style="padding:5px;">考生姓名：</td>
    <td align="left">
     <input type="text" name="name"><font color="red">*</font></td>
    </tr>
    <tr>
    <td height="30" align="left" style="padding:5px;">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
    <td align="left">
   <input type="password" name="pwd" id="pwd1">（密码在6到20位）<font color="red">*</font></td>
    </tr>
  <tr align="center">
    <td width="16%" height="30" align="left" style="padding:5px;">确认密码：</td>
    <td width="84%" align="left">
      <input type="password" name="pwd2" id="pwd2"><font color="red">*</font></td>
    <tr>
    <tr>
    <td height="30" align="left" style="padding:5px;">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
    <td align="left">
    	<input type="radio" name="sex" value="M">男</input>
    	<input type="radio" name="sex" value="FM">女</input>
	</td>
    </tr>	
    <tr align="center">
    <td width="16%" height="30" align="left" style="padding:5px;">提示问题：</td>
    <td width="84%" align="left">
      <input type="text" name="question">（如我的生日）<font color="red">*</font> </td>
    </tr>
	  <tr align="center">
    <td width="16%" height="30" align="left" style="padding:5px;">问题答案：</td>
    <td width="84%" align="left">
      <input type="text" name="answer">（如7月17日）<font color="red">*</font></td>
    </tr>
	  <tr align="center">
    <td width="16%" height="30" align="left" style="padding:5px;">专&nbsp;&nbsp;&nbsp;&nbsp;业：</td>
    <td width="84%" align="left">
       <input type="text" name="profession">
	</td>
    </tr>
	<tr align="center">
    <td width="16%" height="30" align="left" style="padding:5px;">身份证号：</td>
    <td width="84%" align="left">
      <input type="text" name="cardId"><font color="red">*</font></td>
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td>
      <input type="button" id="commit" class="btn_grey" value="保存"/>
        &nbsp; 
      <input type="reset" class="btn_grey" value="取消"/>
      &nbsp;
      <input type="button" class="btn_grey"  value="返回" onclick="location.href='index.jsp'"/>
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
