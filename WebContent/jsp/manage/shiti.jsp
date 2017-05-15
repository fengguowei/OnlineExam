<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<title>网络在线考试――后台管理</title>
<link href="<%=bp %>/css/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=bp %>/js/jquery.min.js"></script>
<script language="javascript">
</script>

</head>
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
              <td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">考试题目管理  &gt;&gt;&gt;</span></td>
              <td align="right"><img src="<%=bp %>/image/m_ico1.gif" width="5" height="9">&nbsp;当前管理员：${manager.name }&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
<table width="96%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="87%" height="27" align="right"><img src="<%=bp %>/image/add.gif" width="19" height="18">&nbsp;</td>
    <td width="13%">
    <a href="<%=bp%>/shiti/goAddShitiPage">添加考试题目</a>
   </td>
  </tr>
</table>
<table width="96%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
<form action="" method="post">
  <tr align="center" bgcolor="#A8D8FC">
	<td width="18%" height="30" bgcolor="#B2D6F1">所属课程</td>
    <td width="28%" bgcolor="#B2D6F1">套题名称</td>
	<td width="33%" bgcolor="#B2D6F1">考试题目</td>
	<td width="9%" bgcolor="#B2D6F1">试题类型</td>
	<td width="6%" bgcolor="#B2D6F1">修改</td>
	<td width="6%" bgcolor="#B2D6F1">选项</td>
  </tr>
  <c:forEach items="${shitilist }" var="shiti">
  <tr>
  	<td style="padding:5px;">${shiti.taoti.lesson.name}</td>
    <td style="padding:5px;">${shiti.taoti.name }</td>
	<td align="center">${shiti.question }</td>
	<td align="center">${shiti.type }</td>	
	<td align="center"><a href="<%=bp %>/shiti/goModifyPage?id=${shiti.id}">修改</a></td>
    <td align="center"><a href="<%=bp %>/shiti/delete?id=${shiti.id}">刪除</a></td>
  </tr>
  </c:forEach> 
</table>
</td>
      </tr>
    </table></td>
  </tr>
</table>
<%@ include file="../copyright.jsp"%>
</body>
</html>
