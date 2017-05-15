<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<head>
<title>添加套题内容</title>
<link href="../../css/style.css" rel="stylesheet">
<script language="javascript">
function checkForm(form){
	if(form.name.value==""){
		alert("请输入套题名称!");form.name.focus();return false;
	}
}
</script>
<body>
<%@ include file="top.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td width="176" align="center" valign="top" bgcolor="#FFFFFF">
    <%@ include file="left.jsp"%></td>
    <td width="602" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">套题信息管理 &gt; 修改套题信息 &gt;&gt;&gt;</span></td>
              <td align="right"><img src="../../image/m_ico1.gif" width="5" height="9">&nbsp;当前管理员：${manager.name }&nbsp;</td>
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
<form action="<%=bp %>/taoti/modify" method="post">

  <table width="63%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center">
    <td width="27%" height="30" align="left" style="padding:5px;">套题名称：</td>
    <td width="73%" align="left">
      <input type="text" name="name" value="${param.name }">
      <input type="hidden" name="id" value="${param.id }">
	  </td>
    <tr>
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td>
      <input type="submit" class="btn_grey" value="保存">
        &nbsp;
       <input type="reset" class="btn_grey" value="取消">
		&nbsp;
		<input type="button" class="btn_grey" value="返回">		</td>
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
