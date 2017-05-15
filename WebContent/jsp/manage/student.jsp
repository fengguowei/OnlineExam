<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<title>网络在线考试――后台管理</title>
<link href="<%=bp %>/css/style.css" rel="stylesheet">


</head>
<body>
<%@ include file="top.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="left.jsp"%></td>
    <td width="602" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">考生信息管理  &gt;&gt;&gt;</span></td>
              <td align="right"><img src="<%=bp %>/image/m_ico1.gif" width="5" height="9">&nbsp;当前管理员：${manager.name }&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
<form action="" method="post">
&nbsp;
<table width="96%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
  <tr align="center" bgcolor="#A8D8FC">
    <td width="15%" height="26" bgcolor="#B2D6F1">准考证号</td>
    <td width="10%" bgcolor="#B2D6F1">考生姓名</td>
	<td width="7%" bgcolor="#B2D6F1">性别</td>
	<td width="26%" bgcolor="#B2D6F1">加入时间</td>
	<td width="13%" bgcolor="#B2D6F1">密码问题</td>	
    <td width="18%" bgcolor="#B2D6F1">身份证号</td>
    <td width="11%" bgcolor="#B2D6F1">删除</td>
  </tr>
  
  <c:forEach items="${studentlist }" var="student">
   <tr>
    <td width="15%">${ student.examNum}</td>
    <td width="10%">${ student.name}</td>
    <td width="7%">${ student.sex == 'M' ? '男':'女'}</td>
    <td width="26%">${ student.createTime}</td>
    <td width="13%">${ student.question}</td>
    <td width="18%">${ student.cardId}</td>
    <td width="11%">&nbsp;	
	<a href="<%=bp %>/student/delete?id=${student.id}" >删除</a>
	</td>
   </tr>
  </c:forEach>
</table>

</form></td>
      </tr>
    </table></td>
  </tr>
</table>
<%@ include file="../copyright.jsp"%>
</body>
</html>
