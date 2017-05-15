<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<title>网络在线考试</title>
<link href="<%=bp %>/css/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="manage/top.jsp"%>

<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="manage/left.jsp"%></td>
    <td width="602" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">考生成绩查询 &gt;&gt;&gt;</span></td>
			  <td align="right"><img src="<%=bp %>/image/m_ico1.gif" width="5" height="9">&nbsp;当前管理员：${manager.name }&nbsp;</td>
<!-- 			    <a href="/default.jsp">返回首页</a>&nbsp; -->
			    </td>
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
<table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
  <tr align="center">
    <td width="16%" height="27" bgcolor="#B2D6F1">准考证号</td>
    <td width="11%" height="27" bgcolor="#B2D6F1">姓名</td>
	<td width="20%" bgcolor="#B2D6F1">所属课程</td>
	<td width="22%" bgcolor="#B2D6F1">考试时间</td>
	<td width="11%" bgcolor="#B2D6F1">单选题分数</td>
	<td width="11%" bgcolor="#B2D6F1">多选题分数</td>
    <td width="9%" bgcolor="#B2D6F1">合计分数</td>
  </tr>
  
  <c:forEach items="${stuResultlist }" var="stuResult">
   <tr>
    <td width="16%">${ stuResult.student.examNum}</td>
    <td width="11%">${ stuResult.student.name}</td>
    <td width="20%">${ stuResult.whichLesson}</td>
    <td width="22%"><fmt:formatDate value="${ stuResult.joinTime }" pattern="yyyy年MM月dd日"/></td>
    <td width="11%">${ stuResult.resSingle}</td>
    <td width="11%">${ stuResult.resMore}</td>
    <td width="9%">${ stuResult.resTotal}</td>
   </tr>
  </c:forEach>
</table>
</td>
      </tr>
    </table>
</td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
