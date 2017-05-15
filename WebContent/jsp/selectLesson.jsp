<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<head>
<title>网络在线考试――后台管理</title>
<script type="text/javascript" src="<%=bp %>/js/jquery.min.js"></script>
<link href="<%=bp %>/css/style.css" rel="stylesheet"/>
<script type="text/javascript">
function F_getTaoTi(val){
	$.ajax({
		async : false,
		type : "POST",
		data : {lessonId:val},
		url : "${_base}/taoti/getTaotiByLessonId",
		success : function(data) {
			$("#whichTaoTi").empty();
			$("#whichTaoTi").html(data);
		}
	});		
}
</script>
</head>
<body>

<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="131" background="<%=bp %>/image/top_bg.jpg">&nbsp;</td>
  </tr>
</table>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="774" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="76%" class="word_grey">&nbsp;<img src="<%=bp %>/image/f_ico.gif" width="8" height="8"> 当前位置：→ <span class="word_darkGrey">在线考试 → 选择考试课程 &gt;&gt;&gt;</span></td>
			  <td width="24%" align="right"><img src="<%=bp %>/image/m_ico1.gif" width="5" height="9">
			    <a href="<%=bp %>/default.jsp" >返回首页</a>&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
<form action="<%=bp%>/exam/ready">
 <table width="100%" height="262"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="90" colspan="3" align="center" class="word_orange1">&nbsp;</td>
</tr>
  <tr>
    <td width="12%">&nbsp;</td>
    <td width="77%" align="center" valign="top">请选择考试课程：
        <select name="taoti.lesson.id" style="width:128px" onchange="F_getTaoTi(this.value)">
	 		<option value="">--请选择--</option>
	 		<c:forEach items="${lessons }" var="l">
	 				<option value="${l.id }">${l.name }</option>
	 		</c:forEach>	 	
	 	</select>
	 </td>
    <td width="11%">&nbsp;</td>
  </tr>
    <tr>
    <td width="12%">&nbsp;</td>
    <td width="77%" align="center" valign="top" >&nbsp;&nbsp;&nbsp;所属套题：
    	<span id="whichTaoTi">
        <select style="width:128px" >	 		
	 		<option value="">--请选择--</option>	 	 	
	 	</select>
	 	</span>
	 </td>
    <td width="11%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="center" valign="top">
    <input type="submit" class="btn_grey" value="确定">
    <input type="button" class="btn_grey" value="返回" onclick="history.back(-1)">
	</td>
    <td>&nbsp;</td>
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
