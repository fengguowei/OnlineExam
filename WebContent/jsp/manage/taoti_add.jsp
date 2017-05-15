<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<head>
<title>添加套题内容</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../../css/style.css" rel="stylesheet">
</head>
<script type="text/javascript">
</script>
<body>
<table width="292" height="175" border="0" cellpadding="0" cellspacing="0" background="../../image/subBG.jpg">
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="12%" height="47">&nbsp;</td>
        <td width="85%" valign="bottom"><table width="86%" height="31" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td class="word_white">添加套题信息</td>
          </tr>
        </table></td>
        <td width="3%">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><table width="100%" height="116"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="116" align="center" valign="top">
<form action="<%=bp %>/taoti/add" method="post">
	<table height="116"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="81" height="30" align="center">选择课程：</td>
        <td width="167">
          <select style="width:128px" name="lessonid">
          	<c:forEach items="${lessons }" var="l">
          		<option value="${l.id }">${l.name }</option>
			</c:forEach>
          </select>
        </td>
      </tr>
      <tr>
        <td height="28" align="center">套题名称：</td>
        <td>
        	<input type="text" name="name">
		</td>
      </tr>
      <tr>
        <td height="30" align="center">&nbsp;</td>
        <td>
        <input type="submit" class="btn_grey" value="保存" >      
		&nbsp;
  <input type="button" class="btn_grey" value="关闭" onclick="window.close();">      
</td>
      </tr>
    </table>
	</form></td>
          </tr>
        </table></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
