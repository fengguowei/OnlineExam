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
<script type="text/javascript">
var openUrl = "";//弹出窗口的url
var iWidth=300; //弹出窗口的宽度;
var iHeight=260; //弹出窗口的高度;
var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
function showTaoti(){
	$.ajax({
		async : false,
		type : "POST",
		url : "${_base}/taoti/getLessons",
		success : function(data) {
			window.open('<%=bp %>/jsp/manage/taoti_add.jsp',"","height="+iHeight+", width="+iWidth+", top="+iTop+", left="+iLeft);
		}
	});		
}
</script>

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
              <td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">套题信息管理  &gt;&gt;&gt;</span></td>
              <td align="right"><img src="<%=bp %>/image/m_ico1.gif" width="5" height="9">&nbsp;当前管理员：${manager.name }&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
<table width="96%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="90%" height="27" align="right"><img src="<%=bp %>/image/add.gif" width="19" height="18">&nbsp;</td>
    <td width="10%">
    	<a href="javascript:void(0)" onClick="showTaoti()">添加套题</a>
	</td>
  </tr>
</table>
<table width="96%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
<form>
  <tr align="center">
    <td width="24%" height="30" bgcolor="#B2D6F1">套题名称</td>
	<td width="20%" bgcolor="#B2D6F1">所属课程</td>
	<td width="32%" bgcolor="#B2D6F1">加入时间</td>
	<td width="12%" bgcolor="#B2D6F1">修改</td>
	<td width="12%" bgcolor="#B2D6F1">选项</td>
  </tr>
	<c:forEach items="${taotilist }" var="taoti">
   <tr>
    <td width="24%">${ taoti.name}</td>
    <td width="20%">${ taoti.lesson.name}</td>
    <td width="32%"><fmt:formatDate value="${ taoti.createTime}" pattern="yyyy年MM月dd日"/></td>
	<td width="12%">&nbsp;
	<a href="./../jsp/manage/taoti_Modify.jsp?id=${taoti.id }&name=${taoti.name}" >修改</a>
	</td>
    <td width="12%">&nbsp;	
	<a href="<%=bp %>/taoti/delete?id=${taoti.id }" >删除</a>
	</td>
   </tr>
   </c:forEach>	
</table>
</form>

</td>
      </tr>
    </table></td>
  </tr>
</table>
<%@ include file="../copyright.jsp"%>
</body>
</html>
