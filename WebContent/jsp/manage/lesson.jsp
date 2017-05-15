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
<script type="text/javascript">
var openUrl = "";//弹出窗口的url
var iWidth=300; //弹出窗口的宽度;
var iHeight=210; //弹出窗口的高度;
var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
function showAddLesson(){
	window.open('<%=bp %>/jsp/manage/lesson_add.jsp',"","height="+iHeight+", width="+iWidth+", top="+iTop+", left="+iLeft)
}
</script>



</head>

<body>
<%@ include file="top.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td width="176" valign="top" bgcolor="#FFFFFF">
    <%@ include file="left.jsp"%></td>
    <td width="602" align="right" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin">
        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">课程信息管理  &gt;&gt;&gt;</span></td>
              <td align="right"><img src="<%=bp %>/image/m_ico1.gif" width="5" height="9">&nbsp;当前管理员：${manager.name }&nbsp;</td>
              </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td align="center" valign="top">
		<table width="92%"  border="0" cellspacing="0" cellpadding="0">
  		<tr>
    		<td width="84%" height="30" align="right"><img src="<%=bp %>/image/add.gif" width="19" height="18">&nbsp;</td>
   			 <td width="16%"><a href="#" onClick="showAddLesson()">添加课程信息</a> </td>
  		</tr>
		</table>
<table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
  <tr align="center" bgcolor="#A8D8FC">
    <td width="30%" height="26" bgcolor="#B2D6F1">课程名称</td>
    <td width="30%" height="26" bgcolor="#B2D6F1">加入时间</td>
    <td width="15%" bgcolor="#B2D6F1">修改</td>
    <td width="15%" bgcolor="#B2D6F1">删除</td>
  </tr>
	 
   <c:forEach items="${lessonlist }" var="lesson">
   <tr>
    <td style="padding:5px;">${ lesson.name}</td>
    <td style="padding:5px;">${ lesson.createTime}</td>
	<td>&nbsp;
	<a href="./../jsp/manage/lesson_Modify.jsp?name=${lesson.name}&ID=${lesson.id}" >修改</a>
	</td>
    <td >&nbsp;	
	<a href="<%=bp %>/lesson/delete?id=${lesson.id}" >删除</a>
	</td>
   </tr>
   </c:forEach>		 
	
</table></td>
      </tr>
    </table></td>
  </tr>
</table>
<%@ include file="../copyright.jsp"%>
</body>
</html>
